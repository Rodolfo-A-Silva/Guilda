//
//  ReceiptDescriptionCell.swift
//  Guilda
//
//  Created by Jardel Souza on 10/11/22.
//

import UIKit

class ReceiptDescriptionCell: UITableViewCell {

    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Descrição"
        return label
    }()
    
    lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Olá, receba essa transfrência para pagar suas contas atrasadas! "
        return label
    }()
    
    lazy var lineView: UIView = {
        let label = UIView()
        label.backgroundColor = .lightGray
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell() {
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelDescription)
        contentView.addSubview(lineView)
        
        labelTitle.Anchor(top: (contentView.topAnchor, 10),
                         left: (contentView.leftAnchor, 20),
                          height: 30
        )
        
        labelDescription.Anchor(top: (labelTitle.bottomAnchor, 10),
                         left: (contentView.leftAnchor, 20),
                         right: (contentView.rightAnchor, 20),
                         bottom: (contentView.bottomAnchor, 10)
        )
        
        lineView.Anchor(left: (contentView.leftAnchor, 0),
                        right: (contentView.rightAnchor, 0),
                          bottom: (contentView.bottomAnchor, 0),
                          height: 1
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
