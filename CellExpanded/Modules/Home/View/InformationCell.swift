import UIKit

final class InformationCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static let identifier: String = "InformationCell"
    
    // MARK: - Private Properties
    
    private lazy var accountLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var valueAccountLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var multilimitLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var valueMultilimitLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
       
    func setupCell(account: String,
                   valueAccount: String,
                   multilimit: String,
                   valueMultilimit: String) {
        accountLabel.text = account
        valueAccountLabel.text = valueAccount
        multilimitLabel.text = multilimit
        valueMultilimitLabel.text = valueMultilimit
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(accountLabel)
        addSubview(valueAccountLabel)
        addSubview(multilimitLabel)
        addSubview(valueMultilimitLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            accountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            accountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            valueAccountLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 10),
            valueAccountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            multilimitLabel.topAnchor.constraint(equalTo: valueAccountLabel.bottomAnchor, constant: 10),
            multilimitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            valueMultilimitLabel.topAnchor.constraint(equalTo: multilimitLabel.bottomAnchor, constant: 10),
            valueMultilimitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            valueMultilimitLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10),
        ])
    }
}
