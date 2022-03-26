//
//  CivilizationRowView.swift
//  SwiftUINetworking
//
//  Created by Tolga Taner on 10.03.2022.
//

import SwiftUI
import Kingfisher

struct CivilizationRowView: View {
    
    private let civilization: Civilization
    
    init(civilization: Civilization) {
        self.civilization = civilization
    }

    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            KFImage.url(URL(string: "https://picsum.photos/id/237/200/300"))
                    .resizable()
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
                    .onProgress { receivedSize, totalSize in  }
                    .onFailure { error in }
                    .placeholder { ProgressView() }
                    .onSuccess { result in }
                    .scaledToFit()
                    .frame(maxWidth: 100, maxHeight: 50)
            VStack(alignment: .leading, spacing: 10) {
                Text(civilization.name)
                Text(civilization.expansion)
            }
        }
    }
}

struct CivilizationRowView_Previews: PreviewProvider {
    static var previews: some View {
        CivilizationRowView(civilization: Civilization(id: -1, name: "Tolga", expansion: "Taner"))
    }
}
