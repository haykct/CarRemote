//
//  HomeViewModel.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 07.12.22.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let bluetoothService: BluetoothService
    
    init(service: BluetoothService) {
        bluetoothService = service
    }
    
    @Published var car = CarModel(model: "QX55", imageName: "infiniti", availableMiles: 120, isLocked: false)
    
    init(bluetoothService: BluetoothService) {
        self.bluetoothService = bluetoothService
    }
    
    func closeDoors() {
        bluetoothService.sendCloseDoorsRequest { [weak self] response in
            self?.car.isLocked = response == .success
        }
    }
    
}
