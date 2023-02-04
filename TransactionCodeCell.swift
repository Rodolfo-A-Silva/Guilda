//
//  TransactionCodeCell.swift
//  Guilda
//
//  Created by Jardel Souza on 10/11/22.
//

import UIKit

class TransactionCodeCell: UITableViewCell {

    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Código da transação"
        return label
    }()
    
    lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "121828717821-00011287y1"
        return label
    }()
    
    lazy var imgCopy: UIButton = {
        let btn = UIButton()
        if let image = UIImage(named: "copy") {
            btn.setImage(image, for: .normal)
        }
        return btn
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
        contentView.addSubview(imgCopy)
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
        
        imgCopy.Anchor(centerY: (contentView.centerYAnchor, 0),
                              right: (contentView.rightAnchor, 10),
                              width: 60,
                              height: 60
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
