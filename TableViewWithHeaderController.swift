//
//  TableViewWithHeaderController.swift
//  Guilda
//
//  Created by rodolfo silva on 09/02/23.
//

import UIKit

class TableViewWithHeaderController: UIViewController {
    
    // frame da visualização principal e estilo do header da tableView
    // style: insetGrouped -> deixa margem leading e trailling
    // style: Grouped -> deixa sem header fixado
    // style: plain -> deixa com header fixado
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewWithConstraint()
       // setupHeaderTableView()
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    func setupViewWithConstraint() {
        let grayView = UIView()
        grayView.backgroundColor = UIColor.yellow
        grayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grayView)

        NSLayoutConstraint.activate([
            grayView.topAnchor.constraint(equalTo: view.topAnchor),
            grayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            grayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            grayView.heightAnchor.constraint(equalToConstant: 200),
            
            tableView.topAnchor.constraint(equalTo: grayView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupHeaderTableView() {
        // Set header por fora na tabela.
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        headerView.backgroundColor = UIColor.lightGray
        
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 160, height: 30))
        headerLabel.text = "Header of TableView"
        headerLabel.textColor = UIColor.white
        headerView.addSubview(headerLabel)
        
        tableView.tableHeaderView = headerView
    }

}

extension TableViewWithHeaderController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // Retorna o número de section na tabela.
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Retorna o número de linhas para cada seção.
        switch section {
        case 0:
            return 5
        case 1:
            return 10
        case 2:
            return 15
        default:
            return 2
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //-- Configura e retorna a célula para a linha especificada.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //-- Verifica erm qual section que alinmenta os valores
        if indexPath.section == 0 {
            cell.textLabel?.text = "menu 0 Row \(indexPath.row)"
            
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "menu 1 Row \(indexPath.row)"
            
        } else {
            cell.textLabel?.text = "menu 2 Row  \(indexPath.row)"
        }

        return cell
    }
}

extension TableViewWithHeaderController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Comanda a altura da header nas sections da tableView
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Comanda a altura das célua da tableView
        if indexPath.section == 0 {
            
            // Manipula altura dentro de cada sections
            if indexPath.row == 0 {
                return 150
            }
            return 50
            
        } else if indexPath.section == 1 {
            return 80
            
        } else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Ação a ser executada quando uma célula é selecionada.
        if indexPath.section == 0 {
            print("estou clicando no menu \(indexPath.section) e na celula \(indexPath.row)")
            
        } else if indexPath.section == 1 {
            print("estou clicando no menu \(indexPath.section) e na celula \(indexPath.row)")
            
        } else {
            print("estou clicando no menu \(indexPath.section) e na celula \(indexPath.row)")
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Configura e retorna a visualização para o cabeçalho da seção especificada.
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
        headerView.backgroundColor = UIColor.lightGray
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        label.text = "Seção \(section)"
        //headerLabel.text = "Header Text"
        label.textColor = UIColor.white
        label.textAlignment = .left
        
        headerView.addSubview(label)
        return headerView
    }
}

