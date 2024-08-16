//
//  MockServices.swift
//  CarsProjectTests
//
@testable import CarsProject
import Foundation

class MockCarDataService: CarDataService {
    override init() {
        super.init()
        // Use a method to provide mock data
    }

    func setMockCarModel(_ carModel: CarModel?) {
        // Simulate the car model as if it was fetched
        DispatchQueue.main.async {
            self.carModel = carModel
        }
    }
}

class MockCarsDataServiceLocal: CarsDataService {
    override init() {
        super.init()
        // Use a method to provide mock saved entities
    }

    func setMockSavedEntities(_ entities: [CarsEntity]) {
        // Simulate the saved entities as if they were fetched
        DispatchQueue.main.async {
            self.savedEntities = entities
        }
    }
}


class MockConnectivityManager: ConnectivityManager {
    private var simulatedConnectionState: Bool = true

    override var isConnected: Bool {
        get {
            return simulatedConnectionState
        }
        set {
            simulatedConnectionState = newValue
        }
    }
}


