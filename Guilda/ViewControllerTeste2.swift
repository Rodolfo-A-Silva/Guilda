//
//  ViewControllerTeste2.swift
//  Guilda
//
//  Created by rodolfo silva on 03/02/23.
//

import UIKit

class ViewControllerTeste2: UIViewController {
    
    var customNavigationView: CustomNavigationView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //  customNavigationView?.viewDelegate = self
        
        //-- with Delegate
        // customNavigationView?.viewDelegate = self
        // onTap()
        customNavigationView?.backButtonTapped = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        //-- with closure
        //        customNavigationView?.backButtonTapped = { [weak self] in
        //            self?.navigationController?.popViewController(animated: true)
        //        }
        
        setupSelector()

    }
    // MARK: - Func
    func setupView() {
        navigationController?.isNavigationBarHidden = true
        view = CustomNavigationView()
        customNavigationView = view as? CustomNavigationView
        //viewModel.viewDelegate = self
    }
    
    func setupSelector() {
        //-- with completion
        customNavigationView?.backButton.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
    }
    
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
    ////            self?.dismiss(animated: true, completion: nil)
    //       self?.dismiss(animated: true, completion: nil)
    //        }
    //    }
}
