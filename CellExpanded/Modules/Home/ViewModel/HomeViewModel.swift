import Foundation
import UIKit

final class HomeViewModel {
    
    // MARK: - Private Properties
    
    var teste = [AnyObject]()
    var tableViewData = [cellData]()
    var tableModel = [Model]()
    
    // MARK: - Init
    
    init() { setupInformations() }
    
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
