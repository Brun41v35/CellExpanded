import UIKit

struct CellObject {
    var title: String?
    var children: [AccordionChild]?
    var opened: Bool?
    var cell: UITableViewCell
    var cellHeight: CGFloat
}
