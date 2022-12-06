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
                NavigationBarView()
                ZStack() {
                    LinearGradient(gradient: Gradient(colors: [Colors.background, .white]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 130)
//                    Image("infiniti")
                    
//                        .padding(.top, 40)
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
    }
}
