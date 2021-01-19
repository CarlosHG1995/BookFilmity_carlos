//
//  BookViewController.swift
//  BookFilmity_carlos
//
//  Created by labcmu on 08/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {
    var libros: Book! = nil
    var pelis: Film! = nil
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var autor: UILabel!
    @IBOutlet weak var anio: UILabel!
    @IBOutlet weak var genero: UILabel!
   
    @IBOutlet weak var lbl_peli_libro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carga_libro()
        carga_peli()
        // Do any additional setup after loading the view.
    }
    func carga_libro(){
        if libros != nil {
        lbl_peli_libro.text = "Libro:"
        titulo?.text = libros.name
        autor?.text = libros.autor
        anio?.text = String(libros.anio)
        genero?.text = libros.genre.description}
    }

    func carga_peli() {
        if pelis != nil {
            lbl_peli_libro.text = "Película:"
            titulo?.text = pelis.name
            autor?.text = pelis.director.joined(separator: " , ")
            anio?.text = String(pelis.anio)
            genero?.text = pelis.cast.joined(separator: " , ")
        }
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
