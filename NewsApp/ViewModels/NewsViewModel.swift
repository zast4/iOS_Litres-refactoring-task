//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

import Foundation

// MARK: - NewsViewModel

@MainActor
final class NewsViewModel: ObservableObject {
    
    enum State {
        case loading
        case success
    }
    
    // MARK: @Published properties
    
    @Published
    private(set) var state: State = .loading
    
    @Published
    var articles: [Article] = []
    
    // MARK: Services
    
    private let newsService: NewsServiceProtocol
        
    init(newsService: NewsServiceProtocol) {
        self.newsService = newsService
    }
    
    func loaderTask() async {
        do {
            articles = try await newsService.fetchLatestNews()
            state = .success
        } catch {
            print("articles error")
        }
    }
}
