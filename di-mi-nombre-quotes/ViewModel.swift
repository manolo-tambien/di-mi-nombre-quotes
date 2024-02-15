//
//  ViewModel.swift
//  di-mi-nombre-quotes
//
//  Created by Manolo on 14/02/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject{
    // Define the Status enum
    enum Status {
        case notStarted
        case fetching
        case success(data: (quote: Quote, character: Character))
        case failed(error: Error)
    }
    
    // By default initialice with .notStarted value
    @Published private(set) var status: Status = .notStarted
    
    // Create controller from FetchController class
    private let controller: FetchController
    
    init(controller: FetchController){
        self.controller = controller
    }
    
    // Fetch the data of the quote and character from the controller
    func getData(for show: String) async{
        // Starts the process of fetching the data
        status = .fetching
        
        do{
            // Gets the quote of specific show
            let quote = try await controller.fetchQuote(from: show)
            
            // Gets the character of specified character name
            let character = try await controller.fetchCharacter(quote.character)
            
            // Changes the status enum for a success state
            status = .success(data: (quote, character))
        } catch{
            status = .failed(error: error)
        }
    }
}
