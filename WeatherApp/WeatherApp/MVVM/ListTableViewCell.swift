import UIKit
import SnapKit

final class ListTableViewCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "not_found")
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 20)
        return name
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let temperature = UILabel()
        temperature.text = "Temperature "
        temperature.textColor = .systemBlue
        temperature.textAlignment = NSTextAlignment.center
        temperature.font = UIFont(name: temperature.font.fontName, size: 26)
        return temperature
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(cellView)
        addSubview(imgView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(temperatureLabel)
        
        cellView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
        }
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(cellView.snp.left)
            make.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.top).offset(5)
            make.left.equalTo(imgView.snp.right).offset(20)
            make.height.equalTo(20)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalTo(imgView.snp.right).offset(20)
            make.bottom.equalTo(imgView.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        
        temperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.top).offset(5)
            make.bottom.equalTo(imgView.snp.bottom).offset(5)
            make.right.equalTo(cellView.snp.right).inset(20)
        }
        
        imgView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
    }
}
