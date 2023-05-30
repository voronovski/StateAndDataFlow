//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(
                title: timer.buttonTitle,
                color: .red,
                action: timer.startTimer
            )
            Spacer()
            
            ButtonView(title: "Log Out", color: .blue, action: logOut)
        }
        .padding()
    }
    
    private func logOut() {
        StorageManager.shared.clear(userManager: userManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
