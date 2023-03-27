//
//  JsonManger.swift
//  JVJ
//
//  Created by Nico Ihle on 07.12.22.
//

import Foundation

struct Person: Codable {
    //INFO: if the JSON is chaning then i have to update this code!
    let chapter, headline, contentpartone, contentpartonetwo: String
    let contentpartthree, arButton, popover: String
    let key: Int
    let isFavorite: Bool
    let logo: String
    
    // Generate samples
    static let allPeople: [Person] = Bundle.main.decode(file: "data.json")
    static let samplePerson: Person = allPeople[0]
}

// Extension to decode JSON locally
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}

