//
//  VideoModel.swift
//  AfricaAnimals
//
//  Created by Atakan Apan on 1/22/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //computed property
    var thumbnail: String{
        "video-\(id)"
    }
}
