import Foundation
import CoreData


extension ExampleItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExampleItem> {
        return NSFetchRequest<ExampleItem>(entityName: "ExampleItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var listItems: NSSet?

}

// MARK: Generated accessors for listItems
extension ExampleItem {

    @objc(addListItemsObject:)
    @NSManaged public func addToListItems(_ value: ExampleListItem)

    @objc(removeListItemsObject:)
    @NSManaged public func removeFromListItems(_ value: ExampleListItem)

    @objc(addListItems:)
    @NSManaged public func addToListItems(_ values: NSSet)

    @objc(removeListItems:)
    @NSManaged public func removeFromListItems(_ values: NSSet)

}

extension ExampleItem : Identifiable {

}
