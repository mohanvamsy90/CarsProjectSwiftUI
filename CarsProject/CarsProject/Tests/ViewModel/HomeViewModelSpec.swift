//
//  HomeViewModelSpec.swift
//  CarsProjectTests
//
//  Created by Mohan Vamsy  on 16/08/24.
//

import XCTest
import Combine
@testable import CarsProject

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockCarDataService: MockCarDataService!
    var mockCarsDataServiceLocal: MockCarsDataServiceLocal!
    var mockConnectivityManager: MockConnectivityManager!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockCarDataService = MockCarDataService()
        mockCarsDataServiceLocal = MockCarsDataServiceLocal()
        mockConnectivityManager = MockConnectivityManager()

        viewModel = HomeViewModel(dataService: mockCarDataService, carsDataServiceLocal: mockCarsDataServiceLocal, connectivityManager: mockConnectivityManager)
        cancellables = []
    }

    override func tearDown() {
        cancellables = nil
        viewModel = nil
        mockCarDataService = nil
        mockCarsDataServiceLocal = nil
        mockConnectivityManager = nil
        super.tearDown()
    }

    func testFetchCarsFromAPI() {
        // Given
        let expectedCarCount = 1
        mockConnectivityManager.isConnected = true
        let mockCars = [CarModelContent(id: 1, title: "Test Car", dateTime: "2023-01-01", content: [], ingress: "Test", image: "1", created: nil, changed: nil)]
        let mockCarModel = CarModel(status: "Success", content: mockCars, serverTime: 1668732951)
        
        // When
        mockCarDataService.setMockCarModel(mockCarModel)
        viewModel.addSubscribers()
        
        // Then
        XCTAssertEqual(viewModel.allCars.count, expectedCarCount)
        XCTAssertEqual(viewModel.allCars.first?.title, "Test Car")
    }

}

