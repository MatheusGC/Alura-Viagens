//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Matheus Golke Cardoso on 17/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var viewPacotes: UIView!
    
    @IBOutlet weak var viewHoteis: UIView!
    
    @IBOutlet weak var TabelaViagens: UITableView!
    
    let listaViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.TabelaViagens.dataSource = self
        self.TabelaViagens.delegate = self
        self.viewPacotes.layer.cornerRadius = 10
        self.viewHoteis.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let viagemAtual = listaViagens[indexPath.row]
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        cell.labelPreco.text = viagemAtual.preco
        cell.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        return cell
    
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 175
    }

}

