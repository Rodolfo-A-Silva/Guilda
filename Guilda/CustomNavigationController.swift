//
//  CustomNavigationController.swift
//  Guilda
//
//  Created by rodolfo silva on 14/01/23.
//

import UIKit

class CustomNavigationController: UIViewController {

    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Click to me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(clickToMe(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func clickToMe(sender: UIButton) {
        print("Open New Controller")
        let vc = ViewControllerTeste2()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Navigation

}
