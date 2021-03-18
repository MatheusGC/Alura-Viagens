//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Matheus Golke Cardoso on 17/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
    
    @IBOutlet weak var TabelaViagens: UITableView!
    
    let listaViagens:Array<String> = ["Rio de Janeiro", "Ceara", "São Paulo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.TabelaViagens.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listaViagens[indexPath.row]
        return cell
    }
    
    

}

