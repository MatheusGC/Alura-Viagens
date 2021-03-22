//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Matheus Golke Cardoso on 18/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate{
   

    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    
    
    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    
    let listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagens.dataSource = self
        colecaoPacotesViagens.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let pacoteAtual = listaViagens[indexPath.item]
        
        celulaPacote.labelTitulo.text = pacoteAtual.viagem.titulo
        celulaPacote.labelQuantidadeDias.text = "\(pacoteAtual.viagem.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(pacoteAtual.viagem.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)

        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        celulaPacote.layer.cornerRadius = 8
        return celulaPacote

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let larguraCelula = collectionView.bounds.width/2
        
        return CGSize(width: larguraCelula-15, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      let pacote = listaViagens[indexPath.item]
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagensViewController
      controller.pacoteSelecionado = pacote
      self.navigationController?.pushViewController(controller, animated: true)
     }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        listaViagens = listaComTodasViagens

        if searchText != "" {

            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains %@", searchText)
            let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
            self.labelContadorPacotes.text = self.atualizaContadorLabel()
            colecaoPacotesViagens.reloadData()
    }
    
    

    func atualizaContadorLabel() -> String {
        
        
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaComTodasViagens.count) pacotes encontrados"
    }
    

}

