import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Propeties
    
    private let homeView: HomeView = HomeView()
    private let homeViewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupTableView()
    }
    
    private func setupCells() {
        
    }
    
    private func setupTableView() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
}

// MARK: - Extension

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionEnum = NumbersEnum(rawValue: section)
        
        switch sectionEnum {
        case .expanded:
            return homeViewModel.rowsForExpandedCell()
        case .normal:
            return homeViewModel.numberTest()
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let sectionEnum = NumbersEnum(rawValue: indexPath.section)
        
        switch sectionEnum {
        case .expanded:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BalanceCell else { return UITableViewCell() }
                
                let data = homeViewModel.getCellExpanded()
                
                cell.setupCell(title: data?.title, value: "testeSub")
                return cell
            }
            
            if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as? InformationCell else { return UITableViewCell() }
                
                let data = homeViewModel.getAnotherCell()
                
                cell.setupCell(account: "alou", valueAccount: "alou", multilimit: "alou", valueMultilimit: "alou")
                return cell
            }
        case .normal:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ModelCell") as? ModelCell else { return UITableViewCell() }
            
            let data = homeViewModel.getNormalCell(index: indexPath.row)
            
            cell.setupCell(accountLabel: "Name", valueAccountLabel: "surname")
            return cell
        case .none:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        
        if indexPath.row == 0 {
            if homeViewModel.tableViewData[indexPath.section].hasAction {
                if homeViewModel.tableViewData[indexPath.section].opened == true {
                    homeViewModel.tableViewData[indexPath.section].opened = false
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                } else {
                    homeViewModel.tableViewData[indexPath.section].opened = true
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                }
            }
        }
    }
}
