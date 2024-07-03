//
//  LoaderView.swift
//  NewsApp
//
//  Created by Litres on 24.06.2024.
//

import SwiftUI

struct LoaderView: UIViewRepresentable {
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .large)
    }

}
