//
//  File.swift
//  finalProject
//
//  Created by Treinamento on 01/08/18.
//  Copyright © 2018 PortoDigital. All rights reserved.
//

import Foundation
import UIKit

class Player{
    var nome: String
    var foto: UIImage
    var score: String
    
    init(nome:String, foto: UIImage, score: String){
        self.nome = nome
        self.foto = foto
        self.score = score
    }
}
