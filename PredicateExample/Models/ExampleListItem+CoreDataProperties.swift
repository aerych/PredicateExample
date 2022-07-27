import Foundation
import CoreData


extension ExampleListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExampleListItem> {
        return NSFetchRequest<ExampleListItem>(entityName: "ExampleListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var lists: NSSet?
    @NSManaged public var item: ExampleItem?

}

// MARK: Generated accessors for lists
extension ExampleListItem {

    @objc(addListsObject:)
    @NSManaged public func addToLists(_ value: ExampleList)

    @objc(removeListsObject:)
    @NSManaged public func removeFromLists(_ value: ExampleList)

    @objc(addLists:)
    @NSManaged public func addToLists(_ values: NSSet)

    @objc(removeLists:)
    @NSManaged public func removeFromLists(_ values: NSSet)

}

extension ExampleListItem : Identifiable {

}
