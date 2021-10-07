//
//  QuoteService.swift
//  SwiftUI Starter
//
//  Created by Brad Kang on 2021-10-06.
//

import Foundation

protocol QuotesService {
    func fetchRandomQuotes() async throws -> [Quote]
}

final class QuotesServiceImpl: QuotesService {
    func fetchRandomQuotes() async throws -> [Quote] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseURL.appending("/api/quotes"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
// .decode(response.self)
