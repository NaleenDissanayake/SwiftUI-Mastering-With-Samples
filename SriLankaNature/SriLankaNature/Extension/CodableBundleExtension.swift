//
//  CodableBundleExtension.swift
//  SriLankaNature
//
//  Created by Naleen Dissanayake on 2026/01/16.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImageModel] {
        // Locate the Json file
        guard let fileURL = url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't find file: \(file)")
        }
        
        // Create a property for the data
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Couldn't load data from: \(file)")
        }
        
        // Create a decoder
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode([CoverImageModel].self, from: data) else {
            fatalError("Couldn't decode data from: \(file)")
        }
        
        return decodedData
    }
}
