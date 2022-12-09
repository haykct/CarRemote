//
//  ContentView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 05.12.22.
//

import SwiftUI
import ActivityIndicatorView

struct EmptyScreen: View {
    let screen: Int
    @State var showLoading = true

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
            TabView(selection: $selectedTab) {
                HomeView(viewModel: HomeViewModel(bluetoothService: DefaultBluetoothService()))
                    .tag(Tab.home)
                EmptyScreen(screen: 2)
                    .tag(Tab.vehicle)
                EmptyScreen(screen: 3)
                    .tag(Tab.location)
                EmptyScreen(screen: 4)
                    .tag(Tab.settings)
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
