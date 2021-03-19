//
//  PacoteViagem.swift
//  Alura Viagens
//
//  Created by Matheus Golke Cardoso on 19/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {

    let nomeDoHotel:String
    let descricao:String
    let dataViagem:String
    @objc let viagem:Viagem
    
    init(nomeDoHotel:String, descricao:String, dataViagem:String, viagem:Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
    }
    
    
    
}
