//
//  ContentView.swift
//  Authentication
//
//  Created by Tolga Taner on 19.03.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var mailAddress: String = String()
    @State private var password: String = String()
    
    private struct Keys {
        static let mailAddress = "Mail Address"
        static let password = "Password"
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 20) {
            TextField(Keys.mailAddress, text: $mailAddress, onCommit: {
                print(mailAddress)
            })
                .frame(height: 44)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
            
            SecureField(Keys.password, text: $password)
                .frame(height: 44)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .padding([.horizontal], 24)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
