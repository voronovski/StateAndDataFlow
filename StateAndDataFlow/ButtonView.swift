//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 5/29/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 60)
        }
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 4)
        )
        .shadow(radius: 9, x: 0, y: 5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Start", color: .red, action: {})
    }
}
