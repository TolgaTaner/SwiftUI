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
        static let button = "Register"
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            VStack(alignment: .center, spacing: 20) {
                TextField(Keys.mailAddress, text: $mailAddress, onCommit: {
                    print(mailAddress)
                })
                    .frame(height: 44)
                    .textFieldStyle(PlainTextFieldStyle())
                    .roundedBorderTextFieldStyle()
                    .submitLabel(.continue)
                
                SecureField(Keys.password, text: $password)
                    .frame(height: 44)
                    .textFieldStyle(PlainTextFieldStyle())
                    .roundedBorderTextFieldStyle()
                    .submitLabel(.done)
            }
            Spacer()
            Spacer()
            Spacer()
            Button(Keys.button) {
                
            }.frame(width: UIScreen.main.bounds.width, height: 44)
                .background(Color.red)
                .foregroundColor(.white)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
