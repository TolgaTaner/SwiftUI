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
    private var searchedObject: SearchedObservableObject<Civilization>?
    @State private var searchTerm: String = String()
    
    init(style: Style,
         searchedObject: SearchedObservableObject<Civilization>? = nil,
         @ViewBuilder content: @escaping () -> Content) {
        self.style = style
        self.searchedObject = searchedObject
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
        .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .automatic)) {
            ForEach(searchedObject?.result ?? searchedObject?.data ?? []) { civilization in
                CivilizationRowView(civilization: civilization)
            }
        }.onChange(of: searchTerm) { searchTerm in
            if searchTerm.isEmpty {
                searchedObject?.result = searchedObject?.data ?? []
                return
            }
            searchedObject?.result = searchedObject?.data.filter { $0.name.lowercased().contains(searchTerm.lowercased()) } ?? []
        }
    }
}
