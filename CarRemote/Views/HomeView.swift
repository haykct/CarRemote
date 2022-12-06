//
//  HomeView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
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
                Text("a")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarItemView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Colors.background, ignoresSafeAreaEdges: .bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
