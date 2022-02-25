//
//  CivilizationListView.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 18.02.2022.
//

import SwiftUI

struct CivilizationListView: View {
    
    private var list: [Civilization]
    
    var body: some View {
        List(list) { civilization in
            Text("\(civilization.name)")
        }
    }
    
    init(list: [Civilization]) {
        self.list = list
    }
    
}

struct CivilizationListView_Previews: PreviewProvider {
    static var previews: some View {
        CivilizationListView(list: [])
    }
}
