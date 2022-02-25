//
//  CivilizationDetailView.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 24.02.2022.
//

import SwiftUI

struct CivilizationDetailView: View {
    
    var civilization: Civilization
    
    init(civilization: Civilization) {
        self.civilization = civilization
    }
    
    var body: some View {
        Text(civilization.name)
    }
}

struct CivilizationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CivilizationDetailView(civilization: Civilization(id: 1, name: "", expansion: ""))
    }
}
