//
//  NavigationBarView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Text("My QX55")
                .font(.system(size: 25))
                .fontWeight(.medium)
                .padding(.trailing, 6)
            Divider()
                .frame(width: 2, height: 30)
                .background(Colors.item)
            HStack(spacing: 0) {
                Image("gas")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                Text("120mi")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 96)
        .background(.white)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
