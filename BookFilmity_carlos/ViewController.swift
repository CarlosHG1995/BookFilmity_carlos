//
//  ViewController.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 29/12/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //lblError.isHidden = true
        let defaults = UserDefaults.standard
        let user: String = defaults.string(forKey: "userrname") ?? ""
        userTxt.text = user
        passTxt.text = ""
        err_lbl = true
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallper1.png")!)
        //let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        //backgroundImage.image = UIImage(named: "wallper1.png")
        //backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        //self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var err_lbl: Bool = true {
        didSet {
            lblError.isHidden = err_lbl
        }
    }
    
    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    @IBOutlet weak var lblError: UILabel!
    @IBAction func Btn_ingresar(_ sender: UIButton) {
        /*if (userTxt.text == "" || passTxt.text == ""){
            lblError.isHidden = false
        }else {
           
            performSegue(withIdentifier: "showitems", sender: self)
            let nom = userTxt.text!
            let pass = passTxt.text!
            UserDefaults.standard.set(nom, forKey: "nom")
           print("usuario ", nom, "password", pass )
        }*/
        let user: String = userTxt.text ?? ""
        let pass: String = passTxt.text ?? ""
        if (user != "" && pass != "") {
            let defaults = UserDefaults.standard
            defaults.set(user, forKey: "username")
            performSegue(withIdentifier: "showitems", sender: sender)
        }
        else {
            err_lbl = false
            lblError.alpha = 0
            UIView.animate(withDuration: 2)
            {
                self.lblError.alpha = 1.0
            }
        }
        
    }
}

