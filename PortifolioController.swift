//
//  PortifolioController.swift
//  Guilda
//
//  Created by rodolfo silva on 07/02/23.
//

import UIKit

class PortifolioController: GuildaUIViewController {

    var portifolioView: PortifolioView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        navigationController?.isNavigationBarHidden = true
        view = PortifolioView()
        portifolioView = view as? PortifolioView
    }
 
}
