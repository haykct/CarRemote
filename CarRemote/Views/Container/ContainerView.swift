//
//  ContentView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 05.12.22.
//

import SwiftUI

struct EmptyScreen: View {
    private var screen = 2

    init(screen: Int) {
        self.screen = screen
    }
    var body: some View {
        VStack {
            Text("Screen \(screen)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.background)
    }
}

struct ContainerView: View {
    @State var selectedTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case .home:
                let viewModel = HomeViewModel(bluetoothService: DefaultBluetoothService())
                
                HomeView(viewModel: viewModel)
            case .vehicle:
                EmptyScreen(screen: 2)
            case .location:
                EmptyScreen(screen: 3)
            case .settings:
                EmptyScreen(screen: 4)
            }
            
            AppTabView(selectedTab: $selectedTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
