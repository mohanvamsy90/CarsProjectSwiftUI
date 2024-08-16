//
//  CarImageService.swift
//  CarsProject

import Foundation
import Combine
import UIKit

class CarImageService {
    
    @Published var image: UIImage? = nil
    @Published var imageData: Data? = nil
    private var imageSubscription: AnyCancellable?
    private let fileManager = LocalFileManager.instance
    private let folderName = "car_images"
    private let carContent: CarModelContent
    private let imageName: String
    
    init (carContent: CarModelContent) {
        self.carContent = carContent
        imageName = "\(carContent.id)"
        if let carImage = carContent.image {
            getCarImage(urlString: carImage)
        }
    }
    
    private func getCarImage(urlString: String) {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("retreiving........")
        } else {
            if let carImage = carContent.image {
                downloadCarImage(urlString: carImage)
                print("downloading.........")
            }
        }
    }
    
    private func downloadCarImage(urlString: String) {
        guard let url = URL(string: Environment.baseURL+"/\(urlString)") else { return }
        imageSubscription = NetworkingManager.execute(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
