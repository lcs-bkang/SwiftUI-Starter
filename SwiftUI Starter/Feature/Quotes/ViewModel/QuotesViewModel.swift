//
//  QuotesViewModel.swift
//  SwiftUI Starter
//
//  Created by Brad Kang on 2021-10-06.
//

import Foundation

// Marking protocols as ObservableObject means that any classes that use the protocol are automatically ObservableObjects
protocol QuotesViewModel: ObservableObject {
    func getRandomQuotes() async
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel {
    
    // (set) means you can only change it within the scope of the class
    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    
    init(service: QuotesService) {
        self.service = service
    }
    
    func getRandomQuotes() async {
        do {
            self.quotes = try await service.fetchRandomQuotes()
            dump(quotes)
        } catch {
            print("Error fetching quotes: \(error)")
        }
    }
}
