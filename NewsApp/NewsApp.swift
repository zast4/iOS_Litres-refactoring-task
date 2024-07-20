//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

import SwiftUI

@main
struct NewsApp: App {
    init() {
        KeychainHelper.addKeyToKeychain(key: Constants.apiKey, keyIdentifier: Constants.keyID)
    }
    
    var body: some Scene {
        WindowGroup {
            NewsView(viewModel: NewsViewModel(newsService: NewsService()))
            
        }
    }
}
