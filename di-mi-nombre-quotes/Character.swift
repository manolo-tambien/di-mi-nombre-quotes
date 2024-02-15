//
//  Character.swift
//  di-mi-nombre-quotes
//
//  Created by Manolo on 14/02/24.
//

import Foundation

struct  Character: Decodable{
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
}
