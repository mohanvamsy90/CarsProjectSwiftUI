//
//  CarsRowView.swift
//  CarsProject


import SwiftUI

struct CarsRowView: View {
    let carModel: CarModelContent
    let gradient = Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0.0)])
    var body: some View {
        VStack {
            CarImageView(carContent: carModel)
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
                    ).frame(maxWidth: .infinity, alignment: .center)
                VStack {
                    Text(carModel.title ?? "")
                        .padding(.leading, 2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("SFUIText-Medium", size: 24))
                    Spacer()
                    Text(carModel.dateTime?.formattedDate() ?? "")
                        .padding(.leading, 2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("SFUIText-Regular", size: 13))
                    Spacer()
                    Text(carModel.ingress ?? "")
                        .padding(.leading, 2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom("SFUIText-Medium", size: 14))
                    Spacer()
                }
            }
        }
    }
}

struct CarsRowView_Previews: PreviewProvider {
    static var previews: some View {
        CarsRowView(carModel: dev.carModelContent)
    }
}
