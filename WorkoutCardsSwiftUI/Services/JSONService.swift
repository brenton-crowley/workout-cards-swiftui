//
//  JSONService.swift
//  WorkoutCardsSwiftUI
//
//  Created by Brent on 22/8/2022.
//

import Foundation

enum JSONError: Error {
    
    case invalidURL, invalidData
    
}

struct JSONService {
    
    static var shared = JSONService()
    
    private init() {
        
    }
    
    func makeModelsForBundleJSONFilename<T: Decodable>(
        _ name: String,
        modelType: T.Type,
        decodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase) throws -> T? {
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else { throw JSONError.invalidURL }
        
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = decodingStrategy
        
        return try decoder.decode(T.self, from: data)
    }
    
}
