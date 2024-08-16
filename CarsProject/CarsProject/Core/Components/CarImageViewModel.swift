//
//  CarImageViewModel.swift
//  CarsProject

import Foundation
import SwiftUI
import Combine

class CarImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let carContent: CarModelContent
    private var dataService: CarImageService? = nil
    private var cancellables = Set<AnyCancellable>()
    
    init(carContent: CarModelContent) {
        self.carContent = carContent
        self.dataService = CarImageService(carContent: carContent)
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService?.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
