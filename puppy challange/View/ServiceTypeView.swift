//
//  ServiceTypeView.swift
//  puppy challange
//
//  Created by Mohsen on 10/27/22.
//

import SwiftUI

struct ServiceTypeView: View {
    @EnvironmentObject var rawModel: CalculateRawModel
    var petType: PetType
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    init(petType: PetType) {
        self.petType = petType
        
    }
    //@State private var numberOfNights: Int = 0
    var body: some View {
        VStack {
            Form {
                Section {
                    Toggle("Grooming", isOn: petType == .cat ? $rawModel.groomyCat : $rawModel.groomyDog)
                        .toggleStyle(CheckBoxToggleStyle())
                    
                    Button(action: viewModel.numberHotelNightButtonPress) {
                        Spacer()
                        Text("Hotel")
                        Spacer()
                    }
                   // .frame()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(Color.buttonColor)
                    .cornerRadius(7)
                   
                } header: {
                    Text("With alert")
                } footer: {
                    Text("you can define number of nights for hotel by an alert ")
                }
                
                Section {
                    Stepper("\(petType == .cat ? rawModel.numberOfNightsHotelForCat : rawModel.numberOfNightsHotelForDog) hotel nights", value: petType == .cat ? $rawModel.numberOfNightsHotelForCat : $rawModel.numberOfNightsHotelForDog, in: 0...365, step: 1)
                } header: {
                    Text("Stepper")
                } footer: {
                    Text("You can put how many night you need hotel by the stepper")
                }
            }
        }
        .textFieldAlert(isShowing: $viewModel.isShowingAlert, outputNumber: petType == .cat ? $rawModel.numberOfNightsHotelForCat : $rawModel.numberOfNightsHotelForDog, title: "How many nights do you need service for your pet?")
    }
}

