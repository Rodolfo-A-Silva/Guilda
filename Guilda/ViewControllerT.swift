//
//  ViewControllerT.swift
//  Guilda
//
//  Created by rodolfo silva on 10/11/22.
//

import UIKit

class ViewControllerT: UIViewController {
    
    
    let controllerUIView = ControllerUIViewT()
    
    override func loadView() {
        self.view = controllerUIView
 
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controllerUIView.tableview.register(ReceiptCell.classForCoder(), forCellReuseIdentifier: "ReceiptCell")
        controllerUIView.tableview.register(ReceiptScheduleCell.classForCoder(), forCellReuseIdentifier: "ReceiptScheduleCell")
        controllerUIView.tableview.register(ReceiptAboutCell.classForCoder(), forCellReuseIdentifier: "ExtractAboutCell")
        controllerUIView.tableview.register(ReceiptDescriptionCell.classForCoder(), forCellReuseIdentifier: "ReceiptDescriptionCell")
        controllerUIView.tableview.register(TransactionCodeCell.classForCoder(), forCellReuseIdentifier: "TransactionCodeCell")
        controllerUIView.tableview.register(ReceiptDataInformationCell.classForCoder(), forCellReuseIdentifier: "ReceiptWhoPaidCell")

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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptScheduleCell", for:
                                                            indexPath) as? ReceiptScheduleCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExtractAboutCell", for:
                                                            indexPath) as? ReceiptAboutCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptDescriptionCell", for:
                                                            indexPath) as? ReceiptDescriptionCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCodeCell", for:
                                                            indexPath) as? TransactionCodeCell else { return UITableViewCell() }
            cell.setupCell()
            cell.selectionStyle = .none
            return cell
            
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptWhoPaidCell", for:
                                                            indexPath) as? ReceiptDataInformationCell else { return UITableViewCell() }
            
           let infos = [ReceiptWhoPaid(info: "Dados do pagador", infoValue: "Jardel Oliveira"),ReceiptWhoPaid(info: "CPF", infoValue: "***.654.321***"),ReceiptWhoPaid(info: "Instituição", infoValue: "335 - Banco Digio"),ReceiptWhoPaid(info: "Dados do pagador", infoValue: "Jardel Oliveira"),ReceiptWhoPaid(info: "CPF", infoValue: "***.654.321***"),ReceiptWhoPaid(info: "Instituição", infoValue: "335 - Banco Digio")]
            
            cell.setupCell(title: "Quem enviou",infos: infos)
            cell.selectionStyle = .none
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptWhoPaidCell", for:
                                                            indexPath) as? ReceiptDataInformationCell else { return UITableViewCell() }
            
           let infos = [ReceiptWhoPaid(info: "Nome", infoValue: "Heitor Nascimento Souza"),ReceiptWhoPaid(info: "CNPJ", infoValue: "98.654.321/0001-10")]
            
            cell.setupCell(title: "Quem recebeu",infos: infos)
            cell.selectionStyle = .none
            return cell
            
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptWhoPaidCell", for:
                                                            indexPath) as? ReceiptDataInformationCell else { return UITableViewCell() }
            
           let infos = [ReceiptWhoPaid(info: "Nome", infoValue: "Heitor Nascimento Souza"),ReceiptWhoPaid(info: "CNPJ", infoValue: "98.654.321/0001-10")]
            
            cell.setupCell(title: "Dados do devedor",infos: infos)
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
