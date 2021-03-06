//
//  ContentView.swift
//  AgeOfEmpiresList
//
//  Created by Tolga Taner on 17.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: CivilizationsViewModel = CivilizationsViewModel(urlString: "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations")
    
    var body: some View {
        ContentNavigationView(style: .title("Age of Empires"), searchedObject: SearchedObservableObject(data: viewModel.datasource.list ?? [])) {
            switch viewModel.datasource {
            case .awaiting: Color.clear.onAppear(perform: viewModel.getCivizilations)
            case .loading: ProgressView()
            case .success(let list):
                CivilizationListView(list: list)
            case .failure(let error): Text(error.localizedDescription)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
