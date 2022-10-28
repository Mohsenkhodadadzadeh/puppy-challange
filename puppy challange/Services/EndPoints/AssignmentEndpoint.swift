//
//  AssignmentEndpoint.swift
//  puppy challange
//
//  Created by Mohsen on 10/28/22.
//

import Foundation

enum AssignmentEndpoint: EndpointProtocol {
    
    case assignment(body: Data)
    
    var baseURL: URL {
        return URL(string: "https://assignment.shly.me/")!
    }
    
    var path: String {
        return ""
    }
    
    var method: UrlMethod {
        return .post
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var body: Data {
        switch self {
        case .assignment(let rawBody):
            return rawBody
        }
    }
    
    
}
