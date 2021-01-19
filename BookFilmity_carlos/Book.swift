//
//  Book.swift
//  BookFilmity_carlos
//
//  Created by cmulab on 30/12/19.
//  Copyright © 2019 cmulab. All rights reserved.
//

import Foundation
struct Book: Codable {
    var name : String
    var autor : String
    var genre : BookGenre
    var anio : Int
    
    enum BookGenre : Int, Codable,CaseIterable {
        case action = 0, terror, adventure, fantasy, sciencefiction, romance, comedy, mistery
        var description: String{
            switch  self {
            case .action:
                return "Action"
             case .terror:
            return "Terror"
                case .adventure:
                return "Adventure"
                case .fantasy:
                return "Fantasy"
                case .sciencefiction:
                return "Science Fiction"
                case .romance:
                return "Romance"
                case .comedy:
                return "Comedy"
                case .mistery:
                return "Mistery"
             
            }
        }
    }
}
