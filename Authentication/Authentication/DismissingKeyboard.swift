//
//  DismissingKeyboard.swift
//  Authentication
//
//  Created by Tolga Taner on 6.04.2022.
//

import SwiftUI
import UIKit

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

extension View {
    func dismissKeyboard() -> some View {
        modifier(DismissingKeyboard())
    }
}
