//
//  Endpoint.swift
//  puppy challange
//
//  Created by Mohsen on 10/28/22.
//

import Foundation

final class APIGenerator {
    let endpointObject: EndpointProtocol
    
    init(endpoint: EndpointProtocol) {
        endpointObject = endpoint
    }
    
    var urlRequest: URLRequest {
        let url = endpointObject.baseURL.appendingPathComponent(endpointObject.path)
        var requestObject = URLRequest(url: url)
        requestObject.httpBody = endpointObject.body
        requestObject.httpMethod = endpointObject.method.rawValue
        
        return requestObject
        
    }
}
