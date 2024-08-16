//
//  CarDataService.swift
//  CarsProject

import Foundation
import Combine

class CarDataService {
    @Published var carModel: CarModel!
    var carSubscription: AnyCancellable?
    
    init() {
        getCarsList()
    }
    
    func getCarsList() {
        guard let url = URL(string: Environment.baseURL+"/carlist") else { return }
        carSubscription = NetworkingManager.execute(url: url)
            .decode(type: CarModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (carModel) in
                self?.carModel = carModel
                self?.carSubscription?.cancel()
            })
    }
}
