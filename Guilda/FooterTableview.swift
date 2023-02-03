//
//  FooterTableview.swift
//  Guilda
//
//  Created by Jardel Souza on 11/11/22.
//

import UIKit

class FooterTableview: UIView {
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Ações"
        return label
    }()
    
    lazy var infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupFooter()
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupFooter() {
        
        let infos = [FooterInfo(nome: "Cancelar agendamento", img: "cancel"),FooterInfo(nome: "Compartilhar", img: "share"),FooterInfo(nome: "Precisa de ajuda?", img: "help")]
        
        var index = 0
        for info in infos {
           
            let view = UIView()
            
            let img = UIImageView()
            img.image = UIImage (named: info.img)
            
            let btn = UIButton()
            btn.contentHorizontalAlignment = .left
            btn.tag = index
            btn.setTitleColor(.black, for: .normal)
            btn.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
            btn.setTitle(info.nome,for: .normal)
            
            let icon = UIImageView()
            icon.image = UIImage (named: "seta")
            
            let lineView = UIView()
            lineView.backgroundColor = .lightGray
            
            addSubview(view)
            view.addSubview(img)
            view.addSubview(btn)
            view.addSubview(icon)
            view.addSubview(lineView)
            
            view.Anchor(top: (infoStack.topAnchor, 0),
                        left: (infoStack.leftAnchor, 0),
                        right: (infoStack.rightAnchor, 0),
                        height: 60
            )
            
            img.Anchor(centerY: (view.centerYAnchor, 0),
                       left: (view.leftAnchor, 20),
                       width: 25,
                       height: 25
                       
            )
            
            btn.Anchor(centerY: (img.centerYAnchor, 0),
                       left: (img.rightAnchor, 20),
                       right: (view.rightAnchor, 40)
            )
            
            icon.Anchor(centerY: (img.centerYAnchor, 0),
                        right: (view.rightAnchor, 0),
                        width: 60,
                        height: 60
            )
            
            lineView.Anchor(left: (btn.leftAnchor, 0),
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
            index += 1
        }
        
    }
    
    @objc func actionButton(sender:UIButton) {
        print("minha tag ", sender.tag)
    }
    
}


extension FooterTableview: CodeView {
    func buildViewHierarchy() {
        addSubview(labelTitle)
        addSubview(infoStack)
    }
    
    func setupConstraint() {
        
        labelTitle.Anchor(top: (topAnchor, 20),
                          left: (leftAnchor, 20),
                          height: 30
        )
        
        infoStack.Anchor(top: (labelTitle.bottomAnchor, 0),
                         left: (leftAnchor, 0),
                         right: (rightAnchor, 0)
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}

struct FooterInfo {
    let nome: String
    let img: String
}
