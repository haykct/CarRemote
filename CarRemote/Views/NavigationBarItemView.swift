//
//  NavigationBarView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI

struct NavigationBarItemView: View {
    let model: String
    let availableMiles: Int
    
    var body: some View {
        HStack {
            Text(model)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.trailing, 6)
            Divider()
                .frame(width: 2, height: 25)
                .overlay(Colors.item)
            HStack(spacing: 0) {
                Image("gas")
                    .resizable()
                    .frame(width: 29, height: 29)
                Text("\(availableMiles)mi")
                    .font(.system(size: 17))
                    .fontWeight(.heavy)
            }
        }
        .fixedSize()
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarItemView(model: "My QX55", availableMiles: 120)
    }
}
