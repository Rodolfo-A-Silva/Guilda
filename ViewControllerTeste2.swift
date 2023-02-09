//
//  ViewControllerTeste2.swift
//  Guilda
//
//  Created by rodolfo silva on 14/01/23.
//

import UIKit

class ViewControllerTeste2: GuildaUIViewController {
    
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
        //-- with Delegate
       // customNavigationView?.viewDelegate = self
        // onTap()
        
        //-- with closure
//        customNavigationView?.backButtonTapped = { [weak self] in
//            self?.navigationController?.popViewController(animated: true)
//        }
        
        //-- with completion
        customNavigationView?.backButton.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
}
    // MARK: - Func
    //-- with completion
    @objc func goToBack() {
        let name = "Reedy"
        customNavigationView?.methodBack(nome: name, completionBlock: {[weak self] resultado, status in

            print("meu nome \(name) meu resultado \(resultado) meu status \(status)")
            if status {
                self?.navigationController?.popViewController(animated: true)
            } else {
                print("aqui false")
            }
         //   self.navigationController?.popViewController(animated: true)
        })
    }

    //-- with Delegate
//extension ViewControllerTeste2: ButtonDelegate {
//    func onTap() {
//       // customNavigationView?.backButtonTapped = { [weak self] in
//        self.navigationController?.popViewController(animated: true)
//       self?.dismiss(animated: true, completion: nil)
//        }
//    }
}
