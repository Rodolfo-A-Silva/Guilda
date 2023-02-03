//
//  ReceiptScheduleCell.swift
//  Guilda
//
//  Created by Jardel Souza on 17/11/22.
//

import UIKit

class ReceiptScheduleCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var viewScheduling: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelTitleScheduling: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Este agendamento não garante o sucesso da transação. Confira o saldo da sua conta na data agendada."
        return label
    }()
    
    lazy var iconScheduling: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .red
        return img
    }()
    
    lazy var stackViewDate: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var viewDate: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelSchedule: UILabel = {
        let label = UILabel()
        label.text = "Agendado para:"
        return label
    }()
    
    lazy var labelScheduleValue: UILabel = {
        let label = UILabel()
        label.text = "26/10/2022"
        return label
    }()
    
    lazy var imgSchedule: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .black
        return img
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
    }
    
    func setupView() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(viewScheduling)
        viewScheduling.addSubview(iconScheduling)
        viewScheduling.addSubview(labelTitleScheduling)
        contentView.addSubview(stackViewDate)
        stackViewDate.addArrangedSubview(viewDate)
        viewDate.addSubview(labelSchedule)
        viewDate.addSubview(labelScheduleValue)
        viewDate.addSubview(imgSchedule)
        viewDate.addSubview(lineView)
    }
    
    
    func setupConstrainst() {
        
        
        stackView.Anchor(top: (contentView.topAnchor, 0),
                         left: (leftAnchor, 20),
                         right: (rightAnchor, 20)
        )

        viewScheduling.Anchor(top: (stackView.topAnchor, 0),
                              left: (stackView.leftAnchor, 0),
                              right: (stackView.rightAnchor, 0)
        )

        labelTitleScheduling.Anchor(centerY: (viewScheduling.centerYAnchor, 0),
                                    top: (viewScheduling.topAnchor, 30),
                                    left: (iconScheduling.rightAnchor, 10),
                                    right: (viewScheduling.rightAnchor, 10)
        )
        
        iconScheduling.Anchor(centerY: (labelTitleScheduling.centerYAnchor, 0),
                              left: (viewScheduling.leftAnchor, 10),
                              width: 30,
                              height: 30
        )
        
        
        stackViewDate.Anchor(top: (stackView.bottomAnchor, 10),
                         left: (leftAnchor, 20),
                         right: (rightAnchor, 20),
                             bottom: (contentView.bottomAnchor, 0)
        )
        
        viewDate.Anchor(top: (stackViewDate.topAnchor, 0),
                              left: (stackViewDate.leftAnchor, 0),
                              right: (stackViewDate.rightAnchor, 0),
                        bottom: (stackViewDate.bottomAnchor, 0)
        )
        
        imgSchedule.Anchor(centerY: (viewDate.centerYAnchor, 0),
                              left: (viewDate.leftAnchor, 10),
                              width: 30,
                              height: 30
        )
        
        
        labelSchedule.Anchor(centerY: (imgSchedule.centerYAnchor, 0),
                                    left: (imgSchedule.rightAnchor, 10)
        )
        
        labelScheduleValue.Anchor(centerY: (imgSchedule.centerYAnchor, 0),
                                  right: (viewDate.rightAnchor, 10)
        )

        lineView.Anchor(top: (labelScheduleValue.bottomAnchor, 20),
                        left: (labelSchedule.leftAnchor, 0),
                        right: (viewDate.rightAnchor, 0),
                          bottom: (viewDate.bottomAnchor, 0),
                          height: 1
        )
        
        
    }
 

}
