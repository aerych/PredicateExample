import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        eraseData()

        stubData()

        testQuery()

    }

    func eraseData() {
        let context = AppDelegate.shared.context

        func deleteRequestResults(_ request: NSFetchRequest<NSFetchRequestResult>) {
            let results = try! context.fetch(request)
            for result in results {
                context.delete(result as! NSManagedObject)
            }
        }

        deleteRequestResults(ExampleList.fetchRequest())
        deleteRequestResults(ExampleListItem.fetchRequest())
        deleteRequestResults(ExampleItem.fetchRequest())

        AppDelegate.shared.saveContext()
    }

    func stubData() {
        let context = AppDelegate.shared.context

        // Three items
        let item1 = ExampleItem(context: context)
        item1.name = "ItemOne"
        let item2 = ExampleItem(context: context)
        item2.name = "ItemTwo"
        let item3 = ExampleItem(context: context)
        item3.name = "ItemThree"

        // Three lists.
        let list1 = ExampleList(context: context)
        list1.name = "ListOne"
        let list2 = ExampleList(context: context)
        list2.name = "ListTwo"
        let list3 = ExampleList(context: context)
        list3.name = "ListThree"

        // Three ListItems
        let listItem1 = ExampleListItem(context: context)
        listItem1.name = "ListItemOne"
        listItem1.item = item1
        let listItem2 = ExampleListItem(context: context)
        listItem2.name = "ListItemTwo"
        listItem2.item = item2
        let listItem3 = ExampleListItem(context: context)
        listItem3.name = "ListItemThree"
        listItem3.item = item3

        // Relations
        list1.listItems = [listItem1]
        list2.listItems = [listItem2, listItem3]
        list3.listItems = [listItem2, listItem3]

        AppDelegate.shared.saveContext()
    }

    func testQuery() {
        let context = AppDelegate.shared.context

        let request = ExampleItem.fetchRequest()
        request.predicate = NSPredicate(format: "NONE listItems.lists.name BEGINSWITH 'ListT'")
//        request.predicate = NSPredicate(format: "SUBQUERY(listItems, $listItem, SUBQUERY($listItem.lists, $list, $list.name BEGINSWITH 'ListT').@count > 0).@count == 0")

        let results = try! context.fetch(request)
        for result in results {
            print("\(result)")
        }
    }
}
