//
//  NewsView.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject
    var viewModel: NewsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .controlSize(.large)
                    .task {
                        await viewModel.loaderTask()
                    }
            case .success:
                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            ForEach(viewModel.articles) { article in
                                HStack(spacing: 8) {
                                    RemoteImageView(url: URL(string: article.imageURL ?? ""), geometry: geometry)
                                        .frame(width: geometry.size.width * Constants.imageWidthCoef, height: geometry.size.width * Constants.imageWidthCoef)
                                    
                                    Text(article.description ?? "")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                }
                                .frame(maxHeight: geometry.size.width * Constants.imageWidthCoef)
                                .padding(16)
                            }
                        }
                    }
                }
            }
        }
    }
}
