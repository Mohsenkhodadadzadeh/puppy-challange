//
//  EndpointProtocol.swift
//  puppy challange
//
//  Created by Mohsen on 10/28/22.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: URL { get }
    
    var path: String { get }
    
    var method: UrlMethod { get }
    
    var headers: [String: String]? { get }
    
    var body: Data { get }
}

enum UrlMethod: String {
    case post = "POST"
    case `get` = "GET"
}
