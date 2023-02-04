//
//  PopUpController.swift
//  Guilda
//
//  Created by rodolfo silva on 03/02/23.
//

import UIKit

public class PopUpController: UIViewController {
    
    var customPopup: CustomPopup? = nil
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        navigationController?.isNavigationBarHidden = true
        view = CustomPopup()
        customPopup = view as? CustomPopup
        view.backgroundColor = UIColor.blackFourOpacityDisable
    }

}
