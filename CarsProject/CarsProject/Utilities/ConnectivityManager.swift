//
//  ConnectivityManager.swift
//  CarsProject

import Network
import Combine

class ConnectivityManager: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published var isConnected = false
    var isConnectedToInternet: Bool {
           return isConnected
       }
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    print("NWPathMonitor: Internet connection is available")
                    self.isConnected = true
                } else {
                    print("NWPathMonitor: No internet connection")
                    self.isConnected = false
                }
            }
        }
        monitor.start(queue: queue)
    }
}


