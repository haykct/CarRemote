//
//  LockButton.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 08.12.22.
//

import SwiftUI

struct LockButton: View {
    @State var isAlertPresented = false
    @Binding var showLoading: Bool
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        Button {
            isAlertPresented = true
        } label: {
            Image("lock")
                .resizable()
                .frame(width: 42, height: 42)
        }
        .frame(width: 64, height: 64)
        .background(viewModel.car.isLocked ? Colors.item : .black)
        .disabled(viewModel.car.isLocked)
        .clipShape(Circle())
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text("Are you sure?"),
                  message: Text("Please confirm that you want to lock the doors of \"My \(viewModel.car.model)\""),
                  primaryButton: .default(Text("Yes, Lock"), action: {
                showLoading = true
                viewModel.closeDoors()
            }),
                  secondaryButton: .cancel())
        }
    }
}

struct LockButton_Previews: PreviewProvider {
    static var previews: some View {
        LockButton(showLoading: .constant(false))
            .environmentObject(HomeViewModel(bluetoothService: DefaultBluetoothService()))
    }
}
