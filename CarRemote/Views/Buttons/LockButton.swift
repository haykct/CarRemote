//
//  LockButton.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 08.12.22.
//

import SwiftUI

struct LockButton: View {
    @Binding var showLoading: Bool
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        Button {
            showLoading = true
            viewModel.closeDoors()
        } label: {
            Image("lock")
                .resizable()
                .frame(width: 42, height: 42)
        }
        .frame(width: 64, height: 64)
        .background(viewModel.car.isLocked ? Colors.item : .black)
        .disabled(viewModel.car.isLocked)
        .clipShape(Circle())
    }
}

struct LockButton_Previews: PreviewProvider {
    static var previews: some View {
        LockButton(showLoading: .constant(false))
            .environmentObject(HomeViewModel(bluetoothService: DefaultBluetoothService()))
    }
}
