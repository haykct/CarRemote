//
//  GradientCarView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI

struct GradientCarView: View {
    let carImageName: String
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Colors.background, .white]), startPoint: .top, endPoint: .bottom)
                .frame(height: 130)
            HStack(spacing: 3) {
                Image("refresh")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Updated 1min ago")
                    .font(.system(size: 15, weight: .heavy))
                    .foregroundColor(Colors.updateText)
            }
            .padding(.top, 27)
            Image(carImageName)
                .resizable()
                .scaledToFit()
                .offset(x: 0, y: 58)
                .frame(width: 280, height: 170)
        }
        .frame(height: 130, alignment: .top)
    }
}

struct GradientCarView_Previews: PreviewProvider {
    static var previews: some View {
        GradientCarView(carImageName: "infiniti")
    }
}
