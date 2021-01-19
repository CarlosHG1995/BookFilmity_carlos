//
//  BookCreationViewController.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 31/12/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import UIKit

class BookCreationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Book.BookGenre.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Book.BookGenre.allCases[row].description
    }

     
    func getData() -> Book? {
        var guardar: Bool = true
        let nom: String = titulo.text ?? ""
        if (nom == "") {
            guardar = false
        }
        let aut: String = autor.text ?? ""
        var anios: Int = 0
        if let val_anio = Int (anio.text ?? "")
        {
            anios = val_anio
        }
        else {
            guardar = false
            anios = 0;
        }
        let el_genero : Book.BookGenre = Book.BookGenre.allCases [genero.selectedRow(inComponent: 0)]
        if (guardar) {
            let books = Book(name: nom, autor: aut, genre: el_genero, anio: anios)
            Vaciar()
            return books
        }else {
            let adver = UIAlertController (title: "Datos erroneos", message: "Ningún campo puede quedar vacío, completelos todos", preferredStyle: .alert)
            adver.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.nulo() }))
            self.present(adver, animated: true, completion: nil)
            return nil
        }
    }
    func Vaciar() // Cuando guarda o cambia de vista, limpia los datos
    {
        titulo.text = ""
        
        autor.text = ""
        
        anio.text = ""
        
        genero.reloadComponent(0)
    }
    
    func nulo()
    {
        
    }
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var anio: UITextField!
    @IBOutlet weak var autor: UITextField!
    
    @IBOutlet weak var lblgenero: UILabel!
    
    @IBOutlet weak var genero: UIPickerView!{
    didSet{
        genero.delegate = self
        genero.dataSource = self}
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
