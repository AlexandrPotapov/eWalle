//
//  LocalDataFetcher.swift
//  eWalle
//
//  Created by Александр on 24.05.2021.
//

import Foundation

import Foundation

protocol DataFetcher {
  func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

class LocalDataFetcher: DataFetcher {
  
  func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
    
    guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
      print("Couldn't find \(urlString) in main bundle.")
      response(nil)
      return
    }
    
    let data = try? Data(contentsOf: file)
    
    let decoded = self.decodeJSON(type: T.self, from: data)
    response(decoded)
  }
  
  func decodeJSON<T>(type: T.Type, from: Data?) -> T? where T : Decodable {
    let decoder = JSONDecoder()
    guard let data = from else { return nil }
    do {
      let objects = try decoder.decode(type.self, from: data)
      return objects
    } catch let jsonError {
      print("Failed to decode JSON", jsonError)
      return nil
    }
  }
}
