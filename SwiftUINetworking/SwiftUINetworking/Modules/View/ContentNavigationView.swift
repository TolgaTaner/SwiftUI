//
//  ContentNavigationView.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 25.02.2022.
//

import SwiftUI

struct ContentNavigationView<Content: View>: View {
    
    enum Style {
        case title(String)
        case titleSubtitle(String, String)
        case titleImage(String, UIImage)
    }
    
    private let style: Style
    private let content: Content
    
    init(style: Style,
         @ViewBuilder content: @escaping () -> Content) {
        self.style = style
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            switch style {
                            case .title(let string):
                                Text(string).bold()
                            case .titleSubtitle(let string, let string):
                                Text(string).bold()
                            case .titleImage(let string, let image):
                                Text(string).bold()
                            }
                        }
                    }
                }
        }
    }
}
