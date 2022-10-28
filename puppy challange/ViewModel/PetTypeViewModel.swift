//
//  PetTypeViewModel.swift
//  puppy challange
//
//  Created by Mohsen on 10/26/22.
//

import SwiftUI

protocol CalculateRwaModelDelegate: AnyObject {
    func update(isEmpty: Bool)
}
extension PetTypeView {
    class ViewModel: ObservableObject {
        
        
        @Published var waitingForResponseFromEndpoint: Bool
        @Published var rawModel: CalculateRawModel
        @Published var rawModelIsEmpty: Bool
        
        var calculateTitleString: String {
            if waitingForResponseFromEndpoint {
                return "Calculating..."
            }
            return "Calculate"
        }
        
        init() {
            rawModel = CalculateRawModel()
            waitingForResponseFromEndpoint = false
            rawModelIsEmpty = true
            rawModel.delegate = self
           
        }
        
        func calculate() {
            print(">>>Calculate")
            waitingForResponseFromEndpoint = true
            
            let requestBodyModel = PuppyRequestBody(dog:
                                            Pet(services:
                                                    PetService(grooming: rawModel.groomyDog, hotel: Hotel(nights: rawModel.numberOfNightsHotelForDog))),
                                        cat: Pet(services:
                                                    PetService(grooming: rawModel.groomyCat, hotel: Hotel(nights: rawModel.numberOfNightsHotelForCat))))
            do {
                let jsonData = try JSONEncoder().encode(requestBodyModel)
                let jsonString = String(data: jsonData, encoding: .utf8)
                print(jsonString)
            } catch {
                
            }
        }
        
    }
    
    
}

class CalculateRawModel: ObservableObject {
    
    @Published var numberOfNightsHotelForCat: Int = 0 {
        didSet {
            delegate?.update(isEmpty: isEmpty)
        }
    }
    @Published var numberOfNightsHotelForDog: Int = 0 {
        didSet {
            delegate?.update(isEmpty: isEmpty)
        }
    }
    @Published var groomyDog: Bool = false {
        didSet {
            delegate?.update(isEmpty: isEmpty)
        }
    }
    @Published var groomyCat: Bool = false {
        didSet {
            delegate?.update(isEmpty: isEmpty)
        }
    }

    weak var delegate: CalculateRwaModelDelegate?
    
    var isEmpty: Bool {
        !groomyCat && !groomyDog && numberOfNightsHotelForCat == 0 && numberOfNightsHotelForDog == 0
    }
    
}


extension PetTypeView.ViewModel: CalculateRwaModelDelegate {
    func update(isEmpty: Bool) {
        rawModelIsEmpty = isEmpty
    }
}
