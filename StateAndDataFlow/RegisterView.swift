//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/4/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
