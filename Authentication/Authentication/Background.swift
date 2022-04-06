//
//  Background.swift
//  Authentication
//
//  Created by Tolga Taner on 6.04.2022.
//

import SwiftUI
    
struct BackgroundContentView<Content: View>: View {
    
    private let content : Content
    private let color: Color
    private let isIgnoringSafeArea: Bool
    
    init(color: Color,
         isIgnoringSafeArea: Bool,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.color = color
        self.isIgnoringSafeArea = isIgnoringSafeArea
    }

    var body: some View {
        ZStack {
            if isIgnoringSafeArea {
                color.ignoresSafeArea()
            }
            else {
                color
            }
            content
        }
    }
}




