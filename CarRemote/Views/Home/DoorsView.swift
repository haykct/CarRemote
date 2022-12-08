//
//  DoorsView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 07.12.22.
//

import SwiftUI
import ActivityIndicatorView

struct DoorsView: View {
    @State var showLoading = false
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .bottom) {
                Text("Doors")
                    .font(.system(size: 20, weight: .heavy))
                
                if showLoading {
                    DoorsStateView(text: "...")
                }
                
                if viewModel.car.isLocked {
                    DoorsStateView(text: "Locked")
                }
            }
            HStack {
                Spacer()
                
                if showLoading {
                    ActivityIndicatorView(isVisible: $showLoading,
                                          type: .growingArc(Colors.item, lineWidth: 2))
                    .frame(width: 64, height: 64)
                } else {
                    LockButton(showLoading: $showLoading)
                }
                
                Spacer()
                UnlockButton(showLoading: showLoading)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 96)
            .background(Colors.buttonContainer)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Colors.border, lineWidth: 2)
            )
        }
        .onReceive(viewModel.$car) { _ in
            showLoading = false
        }
    }
}

struct DoorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsView()
            .environmentObject(HomeViewModel(bluetoothService: DefaultBluetoothService()))
    }
}
