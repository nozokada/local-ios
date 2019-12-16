//
//  DataService.swift
//  local
//
//  Created by Nozomi Okada on 12/14/19.
//  Copyright © 2019 RIR. All rights reserved.
//

import Foundation

class DataService {
    static let shared = DataService()
    
    private let items = [
        Item(title: "Kaytee Silent Spinner 10-inch Exercise Wheel", price: "$5", imageName: "hamster_wheel.jpg", description: nil),
        Item(title: "Splatoon 2 for Nintendo Switch", price: "$35", imageName: "splatoon_2.jpg", description: "I just bought it on last month and but no longer needed. Working perfectly. Like new condition."),
        Item(title: "Wahl Color Pro Complete Hair Cutting Kit", price: "$10", imageName: "clipper.jpg", description: nil),
        Item(title: "Remington All-in-1 Lithium Powered Grooming Kit", price: "$15", imageName: "grooming_kit.jpg", description: nil),
        Item(title: "Toyota 90915-YZZF2 Oil Filters (Set of 2)", price: "$5", imageName: "oil_filter.jpg", description: nil),
    ]
    
    func getItems() -> [Item] {
        return items
    }
}
