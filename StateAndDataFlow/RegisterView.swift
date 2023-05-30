//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/4/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
        
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Text(userManager.user.name.count.formatted())
                    .foregroundColor(userManager.user.name.count < 3 ? .red : .green)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(userManager.user.name.count < 3)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

    }
    
    private func registerUser() {
        userManager.user.isRegistered.toggle()
        StorageManager.shared.save(user: userManager.user)
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
