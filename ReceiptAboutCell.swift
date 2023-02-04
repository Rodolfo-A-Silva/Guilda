//
//  ReceiptAboutCell.swift
//  Guilda
//
//  Created by Jardel Souza on 09/11/22.
//

import UIKit

class ReceiptAboutCell: UITableViewCell {
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Sobre a transação"
        return label
    }()
    
    lazy var labeltext: UILabel = {
        let label = UILabel()
        label.text = "Valor"
        return label
    }()
    
    lazy var labelValue: UILabel = {
        let label = UILabel()
        label.text = "R$ 500,00"
        label.textColor = .blue
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
        contentView.addSubview(labeltext)
        contentView.addSubview(labelValue)
        contentView.addSubview(lineView)
        
        labelTitle.Anchor(top: (contentView.topAnchor, 10),
                         left: (contentView.leftAnchor, 20),
                          height: 30
        )
        
        labeltext.Anchor(top: (labelTitle.bottomAnchor, 10),
                         left: (contentView.leftAnchor, 20),
                         bottom: (contentView.bottomAnchor, 10),
                         height: 30
        )
        
        labelValue.Anchor(right: (contentView.rightAnchor, 20),
                          bottom: (contentView.bottomAnchor, 10),
                          height: 30
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
