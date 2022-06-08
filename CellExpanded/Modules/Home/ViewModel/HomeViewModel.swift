import Foundation
import UIKit

enum NumbersEnum: Int {
    case expanded = 0
    case normal = 1
}

final class HomeViewModel {
    
    // MARK: - Private Properties
    
    var teste = [AnyObject]()
    var tableViewData = [cellData]()
    var tableModel = [Model]()
    
    // MARK: - Init
    
    init() { setupInformations() }
    
    // MARK: - Public Methods
    
    func numberTest() -> Int {
        return tableModel.count
    }
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func rowsForExpandedCell() -> Int {
        if let item = tableViewData.first {
            return item.opened ? 2 : 1
        }
        return 0
    }
    
    func getCellExpanded() -> cellData? {
        return tableViewData.first
    }
    
    func getNormalCell(index: Int) -> Model {
        return tableModel[index]
    }
    
    func getAnotherCell() -> AccordionChild? {
        return tableViewData.first?.children.first
    }
    
    // MARK: - Private Methods
    
    private func setupInformations() {
        tableModel = [Model(name: "Teste", surname: "Alves")]
        
        tableViewData = [cellData(name: "Teste",
                                  surname: "Silva",
                                  hasAction: true,
                                  opened: false,
                                  title: "Saldo disponivel",
                                  children: [AccordionChild(accountBalance: "Saldo",
                                                            valueAccount: "R$ 20",
                                                            multilimit: "Valor: ",
                                                            valueMultilimit: "$: 50")])]
    }
}
