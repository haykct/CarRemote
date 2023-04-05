//
//  CarRemoteTests.swift
//  CarRemoteTests
//
//  Created by Hayk Hayrapetyan on 09.12.22.
//

import XCTest
@testable import CarRemote

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

final class HomeViewModelTests: XCTestCase {
    private var viewModel: HomeViewModel!

    func testCloseDoorsAfterResponseFailure() {
        let expectation = expectation(description: "Expecting negative value in ViewModel after response failure")
        
        viewModel = HomeViewModel(service: MockWithFailure())
        viewModel.closeDoors {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6)
        XCTAssertFalse(viewModel.car.isLocked)
    }
    
    func testCloseDoorsAfterResponseSuccess() {
        let expectation = expectation(description: "Expecting positive value in ViewModel after response success")
        
        viewModel = HomeViewModel(service: MockWithSuccess())
        viewModel.closeDoors {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6)
        XCTAssertTrue(viewModel.car.isLocked)
    }

}
