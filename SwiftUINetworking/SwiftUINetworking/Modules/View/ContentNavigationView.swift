//
//  ContentNavigationView.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 25.02.2022.
//

import SwiftUI

struct ContentNavigationView<Content: View>: View {
    
    private let title: String
    private let content: Content
    
    init(title: String,
         @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content.navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text(title).bold()
                        }
                    }
                }
        }
    }
}
