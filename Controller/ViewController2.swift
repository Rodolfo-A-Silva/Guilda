//
//  ViewController2.swift
//  Guilda
//
//  Created by rodolfo silva on 24/08/22.
//

import UIKit

class ViewController2: GuildaUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        teste()
    }
    
    func teste() {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        title.textAlignment = .center
        title.center = view.center
        title.text = "PAGE 2"
        title.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(title)
    }

}
