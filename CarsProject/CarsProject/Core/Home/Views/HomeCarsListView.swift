//
//  HomeCarListView.swift
//  CarsProject

import SwiftUI

struct HomeCarsListView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State var title: String = "Cars"
    var body: some View {
        ZStack {
            //Background layer
            Color.gray.ignoresSafeArea()
            
            VStack {
                //Header configuration
                HStack {
                    Text(title).font(.headline)
                        .padding(8)
                        .font(.custom("SFUIText-Medium", size: 17))
                        .foregroundColor(.white)
                        
                }
                Spacer(minLength: 16)
                
                //List configuration
                List {
                    ForEach(vm.allCars) { car in
                        CarsRowView(carModel: car)
                            .listRowBackground(Color.black)
                    }
                }.padding(-16)
                .listStyle(PlainListStyle())
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeCarsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeCarsListView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}
