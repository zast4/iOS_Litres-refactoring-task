//
//  NewsService.swift
//  NewsApp
//
//  Created by Даниил on 20.07.2024.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchLatestNews() async throws -> [Article]
}

final class NewsService: NewsServiceProtocol {
    private let baseURL = "https://newsdata.io/api/1/latest"
    private let apiKey = KeychainHelper.getKeyFromKeychain(keyIdentifier: Constants.keyID)
    
    func fetchLatestNews() async throws -> [Article] {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: Constants.keyID, value: apiKey)
        ]
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // TODO: create ENUM for network stuff
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        var articles: [Article] = []
        
        do {
            let data = try decoder.decode(Articles.self, from: data)
            articles = data.articles
        } catch {
            
        }
        
        return articles
    }
}
