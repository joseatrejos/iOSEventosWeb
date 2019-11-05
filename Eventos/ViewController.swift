//
//  ViewController.swift
//  Eventos
//
//  Created by Alumno on 11/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var eventos : [Evento] = []
    @IBOutlet weak var TvEventos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://localhost:8888/Eventos/wp-json/wp/v2/eventos").responseJSON {
            response in
            
            switch (response.result){
                case .success(let datos) :
                    if let arregloEventos = datos as? NSArray {
                        for evento in arregloEventos {
                            if let diccionarioEvento = evento as? NSDictionary {
                                let nuevoEvento = Evento(diccionario:diccionarioEvento)
                                self.eventos.append(nuevoEvento)
                            }
                        }
                        self.TvEventos.reloadData()
                    }
                case .failure(_) :
                        print("Algo salió mal loco")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaEvento") as? celdaEventoController
        
        celda?.lblNombre.text = eventos[indexPath.row].nombre
        celda?.lblFecha.text = eventos[indexPath.row].fecha
        celda?.lblLugar.text = eventos[indexPath.row].lugar
        celda?.lblTipoEvento.text = eventos[indexPath.row].tipoEvento
        
        AF.request(eventos[indexPath.row].urlFlyer).responseImage {
            
            response in
            switch(response.result) {
                case .success(let data):
                    celda?.imgEvento.image = data
                case .failure (_) :
                    print("Algo salió mal con la imagen locoo")
            }
        }
        
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 227
    }
}
