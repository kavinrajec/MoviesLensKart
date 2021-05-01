//
//  DataUtils.swift
//  Movies
//
//  Created by Kavinraj M on 01/05/21.
//

import Foundation

class DataUtils {
    
    static func loadJson<T: Codable>(fileName: String , type : T.Type ) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: ".json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self , from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
}
