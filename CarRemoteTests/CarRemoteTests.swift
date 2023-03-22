//
//  CarRemoteTests.swift
//  CarRemoteTests
//
//  Created by Hayk Hayrapetyan on 09.12.22.
//

import XCTest

struct MockWithFailure: BluetoothService {
    func sendCloseDoorsRequest(completion: @escaping (Response) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(.failure)
        }
    }
}

struct MockWithSuccess: BluetoothService {
    func sendCloseDoorsRequest(completion: @escaping (Response) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion(.success)
        }
    }
}

final class CarRemoteTests: XCTestCase {
    private var viewModel: HomeViewModel!
    
    func f() {}

    func testViewModelAfterResponseFailure() {
        let expectation = expectation(description: "Expecting negative value in ViewModel after response failure")
        
        viewModel = HomeViewModel(service: MockWithFailure())
        viewModel.closeDoors {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6)
        XCTAssertFalse(viewModel.car.isLocked)
    }
    
    func testViewModelAfterResponseSuccess() {
        let expectation = expectation(description: "Expecting positive value in ViewModel after response success")
        
        viewModel = HomeViewModel(service: MockWithSuccess())
        viewModel.closeDoors {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6)
        XCTAssertTrue(viewModel.car.isLocked)
    }

}
