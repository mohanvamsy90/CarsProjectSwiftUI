//
//  CarsProjectApp.swift
//  CarsProject

import SwiftUI

@main
struct CarsProjectApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeCarsListView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
