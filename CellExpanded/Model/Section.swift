import Foundation

class Model {
    var name: String
    var surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

class cellData: Model {
    var hasAction: Bool
    var opened: Bool?
    var title: String
    var children: [AccordionChild]
    
    init(name: String, surname: String, hasAction: Bool, opened: Bool?, title: String, children: [AccordionChild]) {
        self.hasAction = hasAction
        self.opened = opened
        self.title = title
        self.children = children
        super.init(name: name, surname: surname)
    }
}

