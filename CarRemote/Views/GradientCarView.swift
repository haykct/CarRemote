//
//  GradientCarView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI

struct GradientCarView: View {
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Colors.background, .white]), startPoint: .top, endPoint: .bottom)
                .frame(height: 130)
            
            Image("infiniti")
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
        GradientCarView()
    }
}
