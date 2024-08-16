//
//  PreviewProvider.swift
//  CarsProject

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
    //Dummy data for testing
    let carModelContent = CarModelContent(id: 119300, title: "Q5 - Created for almost any landscape.",
                                           dateTime: "29.11.2017 15:12",
                                           content: [ContentData(type: "text", subject: "Q5", description: "Expressive appearance, powerful drive, and pioneering technology. Your options are just as diverse. Every day anew – with the Audi Q5. Don't leave anything to chance. Whether it comes to comfort, style, or dynamics, the Audi Q5 will win you over from the first moment.")],
                                           ingress: "Don't leave anything to chance. Whether it comes to comfort, style, or dynamics, the Audi Q5 will win you over from the first moment. ",
                                           image: "audi_q5.jpg", created: 1511968397,
                                           changed: 1516864387)
    
    let carModel = CarModel(status: "success",
                            content: [CarModelContent(id: 119300, title: "Q5 - Created for almost any landscape.",
                                                      dateTime: "29.11.2017 15:12",
                                                      content: [ContentData(type: "text", subject: "Q5", description: "Expressive appearance, powerful drive, and pioneering technology. Your options are just as diverse. Every day anew – with the Audi Q5. Don't leave anything to chance. Whether it comes to comfort, style, or dynamics, the Audi Q5 will win you over from the first moment.")],
                                                      ingress: "Don't leave anything to chance. Whether it comes to comfort, style, or dynamics, the Audi Q5 will win you over from the first moment. ",
                                                      image: "audi_q5.jpg", created: 1511968397,
                                                      changed: 1516864387),
                                      CarModelContent(id: 119300, title: "Q7 - Greatness starts, when you don't stop.",
                                                      dateTime: "25.05.2018 14:13",
                                                      content: [ContentData(type: "text", subject: "Q7", description: "The Audi Q7 is masculine, yet exudes lightness. Inside, it offers comfort at the highest level. With even more space for your imagination. The 3.0 TDI engine accelerates this powerhouse as a five-seater starting at an impressive 6.3 seconds from 0 to 100 km/h.")],
                                                      ingress: "The Audi Q7 is the result of an ambitious idea: never cease to improve.",
                                                      image: "audi_q7.jpg", created: 1511968425,
                                                      changed: 1534311497)],
                            serverTime: 1668732951)
}
