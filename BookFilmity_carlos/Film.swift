//
//  Film.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 31/12/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import Foundation

struct Film: Codable {
    var name: String
    var director: [String]
    var cast: [String]
    var anio: Int
}
