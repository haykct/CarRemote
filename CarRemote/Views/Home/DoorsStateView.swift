//
//  DoorsStateView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 08.12.22.
//

import SwiftUI

struct DoorsStateView: View {
    let text: String
    
    var body: some View {
        Divider()
            .frame(width: 2, height: 23)
            .overlay(Colors.updateText)
        Text(text)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Colors.updateText)
            .padding(.top, 2)
    }
}

struct DoorsStateView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsStateView(text: "Loading")
    }
}
