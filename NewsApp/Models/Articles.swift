//
//  Articles.swift
//  NewsApp
//
//  Created by Даниил on 20.07.2024.
//

struct Articles: Decodable {
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case articles = "results"
    }
}
