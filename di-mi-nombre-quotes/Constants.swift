//
//  Constants.swift
//  di-mi-nombre-quotes
//
//  Created by Manolo on 14/02/24.
//

import Foundation

enum Constants{
    // breaking bad constant value
    static let bbName = "Breaking Bad"
    // better call saul constant value
    static let bcsName = "Better Call Saul"
    
    static let previewCharacter: Character = {
       let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // Gets from the file directory the json file that contains the character info
        let data = try! Data(contentsOf: Bundle.main.url(
            forResource:"samplecharacter",
            withExtension: "json")!)
        
        // Return the dummy Character
        return try! decoder.decode([Character].self, from:data)[0]
    }()
}

extension String {
    // Replaces empty spaces with a plus sign
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
    
    // Replaces spaces with no space
    var noSpaces: String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    // Set to lower case the noSpace extension
    var lowerNoSpaces: String {
        self.noSpaces.lowercased()
    }
}

