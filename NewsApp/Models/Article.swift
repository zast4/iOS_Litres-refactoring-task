//
//  Article.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

struct Article: Decodable, Identifiable {
    let id: String
    let sourceID: String
    let url: String
    let description: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "article_id"
        case sourceID = "source_id"
        case url = "source_url"
        case description
        case imageURL = "image_url"
    }
}

