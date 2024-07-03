//
//  NewsView.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

import Foundation
import SwiftUI

struct NEWS_VIEW: View {
    @ObservedObject var ViewModel = NewsViewModel()

    var body: some View {
        ZStack {
            LoaderView()
            VStack {
                if ViewModel.Articles.count >= 5 {
                    ForEach(0..<ViewModel.Articles.count) { i in
                        HStack {
                            if ViewModel.Articles[i].image != nil {
                                var Data = try? Data(contentsOf: URL(string: ViewModel.Articles[i].image!)!)
                                if Data != nil {
                                    Image(uiImage: UIImage(data: Data!) ?? UIImage())
                                        .resizable()
                                }
                            }
                            Text(ViewModel.Articles[i].text ?? "?")
                        }
                    }.onAppear(perform: { ViewModel.load_data() })
                }
            }
        }.onAppear(perform: { ViewModel.load_data() })
    }
}
