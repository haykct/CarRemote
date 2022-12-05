//
//  ContentView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 05.12.22.
//

import SwiftUI

struct EmptyScreen: View {
    var body: some View {
        Text("Hello, world!")
    }
}

struct HomeView: View {
    
    var body: some View {
        EmptyScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
