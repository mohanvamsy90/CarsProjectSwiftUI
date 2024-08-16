//
//  CarsDataService.swift
//  CarsProject

import Foundation
import CoreData

class CarsDataService {
    private let container: NSPersistentContainer
    private let containerName: String = "CarsContainer"
    private let entityName = "CarsEntity"
    
    @Published var savedEntities: [CarsEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print(error)
            }
            self.getCars()
        }
    }
    
    // MARK: PUBIC
    
    func updateCars(carContent: CarModelContent) {
        // Check if car is already in entity
        if let entity = savedEntities.first(where: { $0.id == carContent.id }) {
            update(entity: entity, carContent: carContent)
        } else {
            add(carContent: carContent)
        }
    }
    
    // MARK: PRIVATE
    
    private func getCars() {
        let request = NSFetchRequest<CarsEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print(error)
        }
    }
    
    private func add(carContent: CarModelContent) {
        let entity = CarsEntity(context: container.viewContext)
        entity.id = Int32(carContent.id)
        entity.title = carContent.title
        entity.dateTime = carContent.dateTime
        entity.ingress = carContent.ingress
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
    private func applyChanges() {
        save()
        getCars()
    }
    
    private func update(entity:CarsEntity, carContent: CarModelContent) {
        entity.id = Int32(carContent.id)
        entity.title = carContent.title
        entity.dateTime = carContent.dateTime
        entity.ingress = carContent.ingress ?? ""
    }
    
    private func delete(entity: CarsEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
}
