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
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text(name.count.formatted())
                    .foregroundColor(name.count < 3 ? .red : .green)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(name.count < 3)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

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
