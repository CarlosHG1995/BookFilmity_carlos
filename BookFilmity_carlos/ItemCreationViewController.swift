//
//  ItemCreationViewController.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 31/12/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import UIKit

class ItemCreationViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cv_book.isHidden = true
        cv_film.isHidden = false
        //// Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var cv_film: UIView!
    
    @IBOutlet weak var cv_book: UIView!
    
    @IBAction func btn_creaitem(_ sender: UIButton) {
        if (selector.selectedSegmentIndex == 0){
            if let pelicula: Film = filmVC.getData() {
                filmCreatedHandler?(pelicula)
                navigationController?.popViewController(animated: true)
                }
            else {return}
        }
        else {
            if let libro: Book = bookVc.getData() {
                bookCreatedHandler?(libro)
                navigationController?.popViewController(animated: true)
            } else {
                return
            }
        }
        navigationController?.popViewController(animated: true)
       }
    
    
    @IBOutlet weak var selector: UISegmentedControl!
    
    @IBAction func cambia(_ sender: UISegmentedControl) {
        //hay dos maneras de hacer el cambio de vista
        //la primera es con alpha
       /* if sender.selectedSegmentIndex == 0 {
            cv_film.alpha = 1
            cv_book.alpha = 0
            cv_film.isHidden = false
            cv_book.isHidden = false
        } else {
            cv_film.alpha = 0
            cv_book.alpha = 1
            cv_film.isHidden = false
            cv_book.isHidden = false        }*/
        if (selector.selectedSegmentIndex == 0)
        {
            cv_film.isHidden = false
            cv_book.isHidden = true
            bookVc.Vaciar()
        }
        else {
            cv_film.isHidden = true
            cv_book.isHidden = false
            filmVC.Vaciar()
        }
         
    }
    private var filmVC: FilmCreationViewController!
    private var bookVc: BookCreationViewController!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier  == "createfilm")
        {
        filmVC = segue.destination as? FilmCreationViewController
              
              //Data has to be a variable name in your RandomViewController
        }else if (segue.identifier == "createbook"){
            bookVc = segue.destination as? BookCreationViewController
            
        }
    }
    
    var filmCreatedHandler: ((Film) -> Void)?
    var bookCreatedHandler: ((Book) -> Void)?
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
