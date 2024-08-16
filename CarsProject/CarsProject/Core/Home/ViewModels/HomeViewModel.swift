//
//  HomeViewModel.swift
//  CarsProject

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var allCars: [CarModelContent] = []
    private var dataService: CarDataService
    private var carsDataServiceLocal: CarsDataService
    @ObservedObject var connectivityManager: ConnectivityManager
    private var cancellables = Set<AnyCancellable>()
    
    init(dataService: CarDataService = CarDataService(), carsDataServiceLocal: CarsDataService = CarsDataService(), connectivityManager: ConnectivityManager = ConnectivityManager()) {
          self.dataService = dataService
          self.carsDataServiceLocal = carsDataServiceLocal
          self.connectivityManager = connectivityManager
          addSubscribers()
      }
    
    func addAllCarsToLocalDb() {
        for car in allCars {
            self.updateCar(carContent: car)
        }
    }
    
    func addSubscribers() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if self.connectivityManager.isConnectedToInternet {
                print("Fetching data from API")
                // get data from API
                self.dataService.$carModel
                    .sink { [weak self] (returnedCars) in
                        self?.allCars = returnedCars?.content as? [CarModelContent] ?? []
                        self?.addAllCarsToLocalDb()
                    }
                    .store(in: &self.cancellables)
            } else {
                // get data from local storage
                print("No internet, fetching data from local storage")
                self.carsDataServiceLocal.$savedEntities
                    .map({ (carEntities: [CarsEntity]) -> [CarModelContent] in
                        var arrays: [CarModelContent] = []
                        for carEntity in carEntities {
                            let data: CarModelContent = CarModelContent(id: Int(carEntity.id), title: carEntity.title, dateTime: carEntity.dateTime, content: [], ingress: carEntity.ingress, image: "\(carEntity.id)", created: nil, changed: nil)
                            arrays.append(data)
                        }
                        return arrays
                    })
                    .sink { [weak self] (returnedCars) in
                        self?.allCars = returnedCars
                    }
                    .store(in: &self.cancellables)
            }
        }
    }
    func updateCar(carContent: CarModelContent) {
        carsDataServiceLocal.updateCars(carContent: carContent)
    }
}
