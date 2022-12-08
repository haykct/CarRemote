//
//  HomeView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI

struct HomeView: View {
    private let spacing: CGFloat = 20
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                GradientCarView(carImageName: viewModel.car.imageName)
                HStack() {
                    Spacer(minLength: spacing)
                    DoorsView()
                        .environmentObject(viewModel)
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
                    NavigationBarItemView(model: viewModel.car.model,
                                          availableMiles: viewModel.car.availableMiles)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(bluetoothService: DefaultBluetoothService()))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
