//
//  DoorsView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 07.12.22.
//

import SwiftUI

struct DoorsView: View {
    private var iconNames = ["lock", "unlock"]
    
    var body: some View {
        HStack {
            ForEach(iconNames, id: \.self) { item in
                Spacer()
                Button {
                    
                } label: {
                    Image(item)
                        .resizable()
                        .frame(width: 42, height: 42)
                }
                .frame(width: 64, height: 64)
                .background(.black)
                .clipShape(Circle())
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 96)
        .background(Colors.buttonContainer)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Colors.border, lineWidth: 2)
        )
    }
}

struct DoorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsView()
    }
}
