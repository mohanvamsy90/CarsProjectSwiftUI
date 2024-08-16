//
//  CarImageView.swift
//  CarsProject

import SwiftUI

struct CarImageView: View {
    @StateObject var vm: CarImageViewModel
    
    init(carContent: CarModelContent) {
        _vm = StateObject(wrappedValue: CarImageViewModel(carContent: carContent))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "image-placeholder-icon")
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct CarImageView_Previews: PreviewProvider {
    static var previews: some View {
        CarImageView(carContent: dev.carModelContent)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
