//
//  UnlockButton.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 08.12.22.
//

import SwiftUI

struct UnlockButton: View {
    let showLoading: Bool
    
    var body: some View {
        Button {} label: {
            Image("unlock")
                .resizable()
                .frame(width: 42, height: 42)
        }
        .frame(width: 64, height: 64)
        .background(showLoading ? .black.opacity(0.5) : .black)
        .disabled(showLoading)
        .clipShape(Circle())
    }
}

struct UnlockButton_Previews: PreviewProvider {
    static var previews: some View {
        UnlockButton(showLoading: false)
    }
}
