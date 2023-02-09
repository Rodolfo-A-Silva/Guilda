//
//  ViewControllerT.swift
//  Guilda
//
//  Created by rodolfo silva on 10/11/22.
//

import UIKit

class ViewControllerT: GuildaUIViewController {
    
    let controllerUIView = ControllerUIViewT()
    
    override func loadView() {
        self.view = controllerUIView
        controllerUIView.tableview.delegate = self
        controllerUIView.tableview.dataSource = self
        controllerUIView.tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        
       // self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controllerUIView.tableview.register(ReceiptCell.classForCoder(), forCellReuseIdentifier: "ReceiptCell")
        controllerUIView.tableview.register(ReceiptAboutCell.classForCoder(), forCellReuseIdentifier: "ExtractAboutCell")
        controllerUIView.tableview.register(ReceiptDescriptionCell.classForCoder(), forCellReuseIdentifier: "ReceiptDescriptionCell")
        controllerUIView.tableview.register(TransactionCodeCell.classForCoder(), forCellReuseIdentifier: "TransactionCodeCell")
        controllerUIView.tableview.register(ReceiptWhoPaidCell.classForCoder(), forCellReuseIdentifier: "ReceiptWhoPaidCell")
        controllerUIView.tableview.register(ReceiptWhoSentCell.classForCoder(), forCellReuseIdentifier: "ReceiptWhoSentCell")

       // controllerUIView.btnNext.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
//    @objc func nextButton() {
//        scrollViewDidScroll(flow: position, tap: .next)
//    }
    
}

extension ViewControllerT: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return UITableView.automaticDimension
//        }
//        return 0
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  self.controllerUIView.tableview.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptCell", for:
                                                            indexPath) as? ReceiptCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExtractAboutCell", for:
                                                            indexPath) as? ReceiptAboutCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptDescriptionCell", for:
                                                            indexPath) as? ReceiptDescriptionCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCodeCell", for:
                                                            indexPath) as? TransactionCodeCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptWhoPaidCell", for:
                                                            indexPath) as? ReceiptWhoPaidCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptWhoSentCell", for:
                                                            indexPath) as? ReceiptWhoSentCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
       // return UITableViewCell()
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = ReceiptHeader()
//        headerView.backgroundColor = .red
//        return headerView
//    }
//
    
}
