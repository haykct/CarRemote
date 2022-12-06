//
//  AppTabView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI

enum Tab: String {
    case home = "Home"
    case vehicle = "Vehicle"
    case location = "Location"
    case settings = "Settings"
}

struct AppTabItem: Hashable {
    var title: String
    var imageName: String
    var type: Tab { Tab(rawValue: title)! }
}

struct AppTabView: View {
    let height: CGFloat = 83
    let selectedTabColor = Color(red: 166/255, green: 106/255, blue: 83/255)
    let tabItems = [AppTabItem(title: "Home", imageName: "home"),
                    AppTabItem(title: "Vehicle", imageName: "car"),
                    AppTabItem(title: "Location", imageName: "location"),
                    AppTabItem(title: "Settings", imageName: "settings")]
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(tabItems, id: \.title) { item in
                    VStack() {
                        Rectangle().fill(selectedTab == item.type ? selectedTabColor : .white)
                        .frame(width: (geometry.size.width / CGFloat(tabItems.count)) - 25, height: 3)
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / CGFloat(tabItems.count),
                                   height: 25)
                        Text(item.title)
                            .font(.system(size: 14).bold())
                    }
                    .foregroundColor(selectedTab == item.type ? selectedTabColor : .black)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = Tab(rawValue: item.title)!
                        }
                        
                    }
                }
            }
            .frame(width: geometry.size.width, height: height, alignment: .top)
        }
        .frame(maxWidth: .infinity, maxHeight: height)
    }
}
