//
//  PuppyRequestBody.swift
//  puppy challange
//
//  Created by Mohsen on 10/26/22.
//

import Foundation

struct PuppyRequestBody: Codable {
    
    var dog: Pet
    
    var cat: Pet
    
}


enum PetType {
    case cat
    case dog
}
