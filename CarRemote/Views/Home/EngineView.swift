//
//  EngineView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 07.12.22.
//

import SwiftUI

struct EngineView: View {
    private var titles = ["START", "STOP"]
    
    var body: some View {
        HStack {
            ForEach(titles, id: \.self) { item in
                Spacer()
                Button {
                    
                } label: {
                    Text(item)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
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

struct EngineView_Previews: PreviewProvider {
    static var previews: some View {
        EngineView()
    }
}
