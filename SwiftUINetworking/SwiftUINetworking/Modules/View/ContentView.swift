//
//  ContentView.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 17.02.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CivizilationsViewModel = CivizilationsViewModel(urlString: "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations")
    
    var body: some View {
        List(viewModel.list ?? []) { item in
            Text("\(item.name)")
        }.onAppear {
            viewModel.getCivizilations()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
