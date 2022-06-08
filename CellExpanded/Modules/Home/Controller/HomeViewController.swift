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
        return homeViewModel.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if homeViewModel.tableViewData[section].opened == true {
            return homeViewModel.tableViewData[section].children.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BalanceCell else { return UITableViewCell() }
            cell.setupCell(title: homeViewModel.tableViewData[indexPath.section].title, value: "testeSub")
            return cell
        }
        
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as? InformationCell else { return UITableViewCell() }
            cell.setupCell(account: "alou", valueAccount: "alou", multilimit: "alou", valueMultilimit: "alou")
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ModelCell") as? ModelCell else { return UITableViewCell() }
        cell.setupCell(accountLabel: "Name", valueAccountLabel: "surname")
        return cell
        
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
