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
    private let height: CGFloat = 83
    let tabItems = [AppTabItem(title: "Home", imageName: "home"),
                            AppTabItem(title: "Vehicle", imageName: "car"),
                            AppTabItem(title: "Location", imageName: "location"),
                            AppTabItem(title: "Settings", imageName: "settings")]
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabItems, id: \.title) { item in
                Spacer()
                VStack {
                    Image(item.imageName)
                    Text(item.title)
                        .font(.system(size: 12).bold())
                }
                .overlay(
                    Rectangle()
                        .frame(width: 55, height: 2)
                        .offset(x: 0, y: -37)
                        .foregroundColor(selectedTab == item.type ? Colors.item : .clear)
                )
                .padding(.top, 17)
                .foregroundColor(selectedTab == item.type ? Colors.item : .black)
                .onTapGesture {
                    withAnimation {
                        selectedTab = Tab(rawValue: item.title)!
                    }
                }
            }
            Spacer()
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(selectedTab: .constant(.home))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
