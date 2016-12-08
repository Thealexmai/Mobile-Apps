//
//  ImageFetcher.swift
//  Project3_Alex_Mai
//
//  Created by Alex Mai on 12/7/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

enum ImageError: Error {
    case InvalidJSONError
    case NotYetImplementedError
}

enum ImageResult {
    case ImageSuccess(Image)
    case ImageFailure(Error)
}

class ImageFetcher {
    private static let baseUrl = 
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
}
