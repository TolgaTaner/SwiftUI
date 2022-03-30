//
//  RoundedBorderTextFieldStyle.swift
//  Authentication
//
//  Created by Tolga Taner on 30.03.2022.
//

import SwiftUI

struct RoundedBorderTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
         content
            .padding([.horizontal], 4)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            .padding([.horizontal], 24)
     }
}

extension View {
    func roundedBorderTextFieldStyle() -> some View {
        modifier(RoundedBorderTextFieldStyle())
    }
}
