//
//  GuildaUIViewController.swift
//  Guilda
//
//  Created by rodolfo silva on 08/02/23.
//

import UIKit

class GuildaUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLog()
    }
    
    func setupLog() {
        debugPrint("***** \(type(of: self))")
        navigationController?.isNavigationBarHidden = true
    }
}
