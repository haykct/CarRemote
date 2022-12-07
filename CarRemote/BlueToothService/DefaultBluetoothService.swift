//
//  DefaultBluetoothService.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 08.12.22.
//

import Foundation

enum Response {
    case success
    case failure
}

protocol BluetoothService {
    func sendCloseDoorsRequest(completion: @escaping (Response) -> Void)
}

struct DefaultBluetoothService: BluetoothService {
    func sendCloseDoorsRequest(completion: @escaping (Response) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(.success)
        }
    }
}
