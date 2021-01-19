//
//  FilmCreationViewController.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 31/12/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import UIKit

class FilmCreationViewController: UIViewController {
    
    @IBOutlet weak var titulo_film: UITextField!
    @IBOutlet weak var actores: UITextField!
    @IBOutlet weak var director: UITextField!
    @IBOutlet weak var anio: UITextField!
    
    
     func getData()-> Film? {
        var guardar: Bool = true
        let nom: String = titulo_film.text ?? ""
        if (nom == "")
        {
           guardar = false
          }
        let str_dire: String = director.text ?? ""
        let dir: [String] = str_dire.components(separatedBy: ",")
        let str_act: String = actores.text ?? ""
        let acts: [String] = str_act.components(separatedBy: ",")
        var anios: Int = 0
        if let val_anio = Int(anio.text ?? "")
        {
            anios = val_anio
        }else {
            guardar = false
            anios = 0;
        }
        if (guardar) {
            let peli = Film(name: nom, director: dir, cast: acts, anio: anios)
            Vaciar()
            return peli
        } else {
            let alert = UIAlertController(title: "Datos erroneos", message: "Ningún campo puede quedar vacío, completelos todo", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.nulo()}))
            
            self.present(alert, animated: true, completion: nil)
            
            return nil
            
        }
    }
    
    func Vaciar() // Cuando guarda o cambia de vista, limpia los datos
    {
        titulo_film.text = ""
        
        actores.text = ""
        director.text = ""
        anio.text = ""
         }
    
    func nulo()
    {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
