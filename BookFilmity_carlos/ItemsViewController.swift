//
//  ItemsViewController.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 31/12/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import UIKit


class ItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.prompt = NSLocalizedString("¡¡ La App de pelis y films más descargada 🎬🎞📚", comment: "")
        tabla.dataSource = self
        tabla.delegate = self
        tabla.backgroundView = UIImageView(image: UIImage(named: "wallper1.png"))
        let bsalir = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(Logout))
        self.navigationItem.leftBarButtonItem = bsalir
        loadItemsFromStorage()
        
        //libros = [Book(name: "Hola", autor: "Yo", genre: Book.BookGenre.action, anio: 2019)]
        //pelis = [Film(name: "Apoca now", director: ["kubric, él"], cast: ["ella, nos, vos"], anio: 2020)]
        // Do any additional setup after loading the view.
    }
     @objc func Logout()
       {
           let defaults = UserDefaults.standard
           
           defaults.removeObject(forKey: "username")
           
           dismiss(animated: true, completion: nil)
       }
    func loadItemsFromStorage()
    {
        let defaults = UserDefaults.standard
         let decoder = JSONDecoder()
        if let savedBooks = defaults.object(forKey: "libros") as? Data
        {
            if let loadedBooks = try? decoder.decode([Book].self, from: savedBooks)
            {
                libros = loadedBooks   }
        }
        if let savedFilms = defaults.object(forKey: "peliculas") as? Data
        {
            if let loadedFilms = try? decoder.decode([Film].self, from: savedFilms)
            {
                peliculas = loadedFilms
            }
        }
        
    }
    @IBAction func mas(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "createItem", sender: self)
    }
    
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "createItem") {
            guard  let createVC = segue.destination as? ItemCreationViewController
                else {return}
            createVC.bookCreatedHandler = bookCreated
            createVC.filmCreatedHandler = filmCreated
        }/**/
        if (segue.identifier == "ver_book") {
            if let createVC = segue.destination as? BookViewController {
                if let libro = sender as? Book
                {
                    createVC.libros = libro
                }
            }
        }
        if (segue.identifier == "ver_book") {
            if let createVC = segue.destination as? BookViewController {
                if let pelicula = sender as? Film {
                    createVC.pelis = pelicula
                }
            }
        }
 
    }
    
    private var libros: [Book] = []
    {
        didSet
        {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(libros)
            {
                let defaults = UserDefaults.standard
                
                defaults.set(encoded, forKey: "libros")
            }
            
            tabla.reloadData() // Actualizar la tabla
        }
    }
    
    private var peliculas: [Film] = []
    {
        didSet
        {
            let encoder = JSONEncoder()
             if let encoded = try? encoder.encode(peliculas)
            { let defaults = UserDefaults.standard
                 defaults.set(encoded, forKey: "peliculas")
            }
             tabla.reloadData() // Actualizar la tabla
        }
    }
    func bookCreated(item: Book)
       {   libros.append(item)
            tabla.reloadData()
         }
    
    func filmCreated(item: Film)
    {  peliculas.append(item)
         tabla.reloadData()
    }
    
    @IBOutlet weak var tabla: UITableView!
     {
           didSet
           {
               tabla.delegate = self
               
               tabla.dataSource = self
           }
       }
           /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ItemsViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return peliculas.count
        }
        else {
            return libros.count
        }
    }
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as? ItemTableViewCell
        {
            if (indexPath.section == 0) {
                cell.setup(for: peliculas[indexPath.row])
            }
            else {
                cell.setup(for: libros[indexPath.row])
            }
            return cell
            }
        else {
            let cell = UITableViewCell.init()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "PELÍCULAS"
        } else {
            return "LIBROS"
        }
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            if (indexPath.section == 0) {
                peliculas.remove(at: indexPath.row)
                //tabla.deleteRows(at: [indexPath], with: .fade)
                tabla.reloadData()
            }
            else {
             libros.remove(at: indexPath.row) }
            //tabla.deleteRows(at: [indexPath], with: .fade)
            tabla.reloadData()
            }
        
}
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
         
        if (indexPath.section == 0)
        {
            performSegue(withIdentifier: "ver_book", sender: peliculas[indexPath.row])
            print("clic ver book pelis \(peliculas[indexPath.row])")
        }
        else {
            performSegue(withIdentifier: "ver_book", sender: libros[indexPath.row])
           }
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
