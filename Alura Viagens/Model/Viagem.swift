//
//  Viagem.swift
//  Alura Viagens
//
//  Created by Matheus Golke Cardoso on 18/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Viagem: NSObject {

    @objc let titulo:String
    let quantidadeDeDias:Int
    let preco:String
    let caminhoDaImagem:String
    
    init(titulo:String, quantidadeDeDias:Int, preco:String, caminhoDaImagem:String){
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
