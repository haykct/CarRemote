//
//  DoorsView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 07.12.22.
//

import SwiftUI
import ActivityIndicatorView

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

struct UnlockButton: View {
    var showLoading: Bool
    
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

struct DoorsView: View {
    @State var showLoading = false
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .bottom) {
                Text("Doors")
                    .font(.system(size: 20, weight: .heavy))
                Divider()
                    .frame(width: 2, height: 23)
                    .overlay(Colors.updateText)
                Text("Locked")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Colors.updateText)
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
