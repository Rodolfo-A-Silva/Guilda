//
//  ViewControllerTeste2.swift
//  Guilda
//
//  Created by rodolfo silva on 14/01/23.
//

import UIKit

class ViewControllerTeste2: UIViewController {
    
    var customNavigationView: CustomNavigationView? = nil
    
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupView() {
        view.backgroundColor =  UIColor.whiteTwo
        navigationController?.isNavigationBarHidden = true
        view = CustomNavigationView()
        customNavigationView = view as? CustomNavigationView
      //  customNavigationView?.viewDelegate = self
        // onTap()
        
        customNavigationView?.backButtonTapped = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
}

//extension ViewControllerTeste2: ButtonDelegate {
//    func onTap() {
//       // customNavigationView?.backButtonTapped = { [weak self] in
//        self.navigationController?.popViewController(animated: true)
////            self?.dismiss(animated: true, completion: nil)
//        }
//    }
}


