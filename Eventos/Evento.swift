//
//  Evento.swift
//  Eventos
//
//  Created by Alumno on 11/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Evento {
    
    var nombre : String
    var fecha : String
    var urlFlyer : String
    
    var lugar : String?
    var tipoEvento : String?
    
    init(nombre : String, fecha : String, urlFlyer : String) {
        self.nombre = nombre
        self.fecha = fecha
        self.urlFlyer = urlFlyer
    }
}
