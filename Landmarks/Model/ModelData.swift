//
//  ModelData.swift
//  Landmarks
//
//  Created by 김민창 on 2022/04/02.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    // Because you’ll never modify hike data after initially loading it, you don’t need to mark it with the @Published attribute.
    var hikes: [Hike] = load("hikeData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary (
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// fetches JSON data with a given name from the app’s main bundle.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
