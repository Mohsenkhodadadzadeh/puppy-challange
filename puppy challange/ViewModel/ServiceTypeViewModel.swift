//
//  ServiceTypeViewModel.swift
//  puppy challange
//
//  Created by Mohsen on 10/27/22.
//

import SwiftUI

extension ServiceTypeView {
    class ViewModel: ObservableObject {
        
        @Published var isShowingAlert: Bool = false
        @Published var numberHotelNight: Int = 0
        
        
        func numberHotelNightButtonPress() {
            isShowingAlert.toggle()
        }
    }
}
