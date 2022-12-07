//
//  HomeViewModel.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 07.12.22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var car = CarModel(model: "QX55", availableMiles: 120, isLocked: false)
}
