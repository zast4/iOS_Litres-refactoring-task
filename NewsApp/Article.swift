//
//  Article.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

class Article {
    var url: String
    var id: String
    var text: String?
    var image: String?

    init(url: String, id: String, text: String?, image: String?) {
        self.url = url
        self.id = id
        self.text = text
        self.image = image
    }
}
