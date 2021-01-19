//
//  ItemTableViewCell.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 05/01/2020.
//  Copyright © 2020 cmulab. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var detalle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(for book: Book){
        titulo.text = book.name
        detalle.text = book.genre.description
    }
    func setup(for film: Film){
        titulo.text = film.name
        detalle.text = String(film.anio)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
