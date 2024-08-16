//
//  CarModel.swift
//  CarsProject

import Foundation

// MARK: - CarModel
struct CarModel: Codable {
    let status: String?
    let content: [CarModelContent?]
    let serverTime: Double?
}

// MARK: - CarModelContent
struct CarModelContent: Codable, Identifiable {
    let id: Int
    let title, dateTime: String?
    let content: [ContentData?]
    let ingress, image: String?
    let created, changed: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case created, changed
        case ingress, image, title, dateTime
        case content
    }
}

// MARK: - ContentContent
struct ContentData: Codable {
    let type, subject, description: String?
}
