//
//  HomeView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI
import ActivityIndicatorView

struct HomeView: View {
//    @State var showLoadingIndicator = true
    private var spacing: CGFloat = 20
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                GradientCarView()
                HStack() {
                    Spacer(minLength: spacing)
                    DoorsView()
                    Spacer(minLength: spacing)
                    EngineView()
                    Spacer(minLength: spacing)
                }
                .padding(.top, 150)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Colors.background, ignoresSafeAreaEdges: .bottom)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarItemView()
                }
            }
            
//            ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .growingArc(.green, lineWidth: 2))
            //                    .frame(width: 100, height: 100)
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
