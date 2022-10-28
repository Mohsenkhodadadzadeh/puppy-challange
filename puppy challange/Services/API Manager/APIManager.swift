//
//  APIManager.swift
//  puppy challange
//
//  Created by Mohsen on 10/28/22.
//

import Foundation
import Combine

final class APIManager {
    
    private init() {
        
    }
    
    public static var shared: APIManager = APIManager()
    
    func fetchCalculate(body: Data) -> AnyPublisher<AssignmentResult, Error> {
        
        let urlRequest = APIGenerator(endpoint: AssignmentEndpoint.assignment(body: body))
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest.urlRequest)
            .map{ $0.data }
            .decode(type: AssignmentResult.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
}
