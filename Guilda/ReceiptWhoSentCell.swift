//
//  ReceiptWhoSentCell.swift
//  Guilda
//
//  Created by Jardel Souza on 10/11/22.
//

import UIKit

class ReceiptWhoSentCell: UITableViewCell {

    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Quem recebeu"
        return label
    }()
    
    lazy var infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell() {
        
        let infos = ["jardel","rodolfo","santos"]
        
        for info in infos {
            
            let view = UIView()
            
            let labelName = UILabel()
            labelName.textColor = .gray
            labelName.text = "Nome"
            
            let labelNameValue = UILabel()
            labelNameValue.textAlignment = .right
            labelNameValue.text = "\(info)"
            
            let lineView = UIView()
            lineView.backgroundColor = .lightGray
            
            contentView.addSubview(view)
            view.addSubview(labelName)
            view.addSubview(labelNameValue)
            view.addSubview(lineView)
            
            view.Anchor(top: (infoStack.topAnchor, 0),
                        left: (infoStack.leftAnchor, 0),
                        right: (infoStack.rightAnchor, 0),
                        height: 60
            )
            
            labelName.Anchor(top: (view.topAnchor, 0),
                                  left: (view.leftAnchor, 20),
                                  bottom: (view.bottomAnchor, 10)
            )
            
            labelNameValue.Anchor(top: (view.topAnchor, 0),
                                  right: (view.rightAnchor, 20),
                                  bottom: (view.bottomAnchor, 10)
            )
            
            lineView.Anchor(left: (view.leftAnchor, 0),
                            right: (view.rightAnchor, 0),
                            bottom: (view.bottomAnchor, 0),
                            height: 1
            )
            
            let childStackView = UIStackView(arrangedSubviews: [view])
            childStackView.alignment = .fill
            childStackView.axis = .vertical
            childStackView.distribution = .fill
            childStackView.spacing = 20
            
            childStackView.translatesAutoresizingMaskIntoConstraints = false
            infoStack.addArrangedSubview(childStackView)
            
        }
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(labelTitle)
        contentView.addSubview(infoStack)
        
        labelTitle.Anchor(top: (contentView.topAnchor, 10),
                         left: (contentView.leftAnchor, 20),
                          height: 30
        )

        infoStack.Anchor(top: (labelTitle.bottomAnchor, 0),
                         left: (contentView.leftAnchor, 0),
                         right: (contentView.rightAnchor, 0),
                         bottom: (contentView.bottomAnchor, 0)
        )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
