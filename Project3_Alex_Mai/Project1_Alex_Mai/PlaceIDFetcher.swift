//
//  PlaceIDFetcher.swift
//  Project3_Alex_Mai
//
//  Created by Alex Mai on 12/10/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

enum PlaceIDError: Error {
    case InvalidJSONError
}

enum PlaceIDResult {
    case PlaceIDSuccess(PlaceID)
    case PlaceIDFailure(Error)
}

class PlaceIDFetcher {
    private static let baseUrl = "https://maps.googleapis.com/maps/api/geocode/json"
    
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchPlaceID(for latitude: Double, longitude: Double, completion: @escaping (PlaceIDResult) -> Void) {
        let placeIDUrl = PlaceIDFetcher.getUrl(for: latitude, longitude: longitude)
        
        let request = URLRequest(url: placeIDUrl)
        
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            guard let searchResult = data else {
                completion(.PlaceIDFailure(error!))
                return
            }
            
            completion(PlaceIDFetcher.getPlaceIDResult(from: searchResult))
        }
        task.resume()
    }
    
    private static func getUrl(for latitude: Double, longitude: Double) -> URL {
        var components = URLComponents(string: baseUrl)!
        
        //set up query parameters
        var queryItems = [URLQueryItem]()
        
        //latlng
        queryItems.append(URLQueryItem(name: "latlng", value: "\(latitude),\(longitude)"))
        //key
        queryItems.append(URLQueryItem(name: "key", value: "AIzaSyD1rWn9m3sSj3nWUVRBCFFFucavvNrp9bk"))
        
        components.queryItems = queryItems
        
        //create and log URL
        return components.url!
    }
    
    private static func getPlaceIDResult(from json: Data) -> PlaceIDResult {
        do {
            let jsonObject: Any = try JSONSerialization.jsonObject(with: json, options: [])
            
            guard let jsonDict = jsonObject as? [String:AnyObject],
            let results = jsonDict["results"] as? [[String:AnyObject]] else {
                    return .PlaceIDFailure(PlaceIDError.InvalidJSONError)
            }
            
            let firstResult = results[0] as [String:AnyObject]            
            
            
            let placeID = PlaceID(id: firstResult["place_id"] as? String)
            
            return .PlaceIDSuccess(placeID)
            
        }
        catch let error {
            return .PlaceIDFailure(error)
        }
    }
}
