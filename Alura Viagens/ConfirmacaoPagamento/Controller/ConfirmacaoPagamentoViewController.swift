//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Matheus Golke Cardoso on 22/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    var pacoteComprado:PacoteViagem? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pacote = pacoteComprado {
            print(pacote.viagem.titulo)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
