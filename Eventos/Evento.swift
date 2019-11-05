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
    var lugar : String
    var tipoEvento : String
    
    init(nombre : String, fecha : String, urlFlyer : String, lugar : String, tipoEvento : String) {
        self.nombre = nombre
        self.fecha = fecha
        self.urlFlyer = urlFlyer
        self.lugar = lugar
        self.tipoEvento = tipoEvento
    }
    
    init(diccionario : NSDictionary) {
        
        // Get events' names from the server
        self.nombre = ""
        
        if let title = diccionario.value(forKey:"title") as? NSDictionary {
            if let rendered = title.value(forKey: "rendered") as? String {
                self.nombre = rendered
            }
        }
        
        self.fecha = ""
        self.lugar = ""
        self.urlFlyer = ""
        self.tipoEvento = ""
        
        if let acf = diccionario.value(forKey:"acf") as? NSDictionary {
            
            // Get events' dates from the server
            if let fecha = acf.value(forKey: "Fecha") as? String {
                self.fecha = fecha
            }
            
            // Get events' places from the server
            if let lugar = acf.value(forKey: "lugar") as? String {
                self.lugar = lugar
            }
            
            // Get events' images from the server
            if let flyer = acf.value(forKey: "flyer") as? String {
                self.urlFlyer = flyer
            }
            
            // Get events' places from the server
            if let evento = acf.value(forKey: "tipo_de_evento") as? String {
                self.tipoEvento = evento
            }
        }
    }
}
