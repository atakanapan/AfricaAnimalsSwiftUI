//
//  CodableBundleExtension.swift
//  AfricaAnimals
//
//  Created by Atakan Apan on 1/16/23.
//

import Foundation
// IYI BIR EXTENSION ORNEGI
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // locate the jeson file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle!")
        }
        // create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle!")
        }
        // create a decoder
        let decoder = JSONDecoder()
        // create a property for teh decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        // return data
        return loaded
    }
}
