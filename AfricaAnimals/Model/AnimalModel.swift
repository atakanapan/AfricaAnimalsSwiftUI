//
//  AnimalModel.swift
//  AfricaAnimals
//
//  Created by Atakan Apan on 1/16/23.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
