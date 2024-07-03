//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

import Combine
import SwiftUI

class NewsViewModel: ObservableObject {
    var Articles: [Article] = .init()

    @MainActor
    func load_data() {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://newsdata.io/api/1/latest?apikey=pub_469557aab365fc415e4407afbcd7e06fb5d87")!), completionHandler: { Data, Response, Error in
            var Data = try! JSONSerialization.jsonObject(with: Data!) as! [String: Any]
            var List = Data["results"] as! [[String: Any]]
            for i in 0..<List.count {
                self.Articles.append(Article(url: List[i]["source_url"]! as! String, id: List[i]["source_id"]! as! String, text: List[i]["description"] as? String, image: List[i]["image_url"] as? String))
            }
        })
    }
}
