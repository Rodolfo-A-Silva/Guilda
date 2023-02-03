//
//  ReceiptCell.swift
//  Guilda
//
//  Created by Jardel Souza on 09/11/22.
//

import UIKit

class ReceiptCell: UITableViewCell {
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Comprovante de agendamento"
        return label
    }()
    
    lazy var labelDate: UILabel = {
        let label = UILabel()
        label.text = "24/10/2022 - 12:03"
        label.textColor = .gray
        return label
    }()
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstrainst()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelDate)
    }
    
    
    func setupConstrainst() {
        
        labelTitle.Anchor(top: (contentView.topAnchor, 10),
                          left: (contentView.leftAnchor, 20)
        )
        
        labelDate.Anchor(top: (labelTitle.bottomAnchor, 10),
                         left: (contentView.leftAnchor, 20),
                         bottom: (contentView.bottomAnchor, 10)
        )
    }
    
    
    
}
