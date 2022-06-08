import UIKit

final class ModelCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static let identifier: String = "ModelCell"
    
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
    func setupCell(accountLabel: String, valueAccountLabel: String) {
        self.accountLabel.text = accountLabel
        self.valueAccountLabel.text = valueAccountLabel
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(accountLabel)
        addSubview(valueAccountLabel)
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
    }
}
