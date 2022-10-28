//
//  PetTypeView.swift
//  puppy challange
//
//  Created by Mohsen on 10/26/22.
//

import SwiftUI

struct PetTypeView: View {
    
    @StateObject private var viewModel: ViewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("which type of pet do you have?")
                    .padding(.bottom, 15)
                
                NavigationLink(destination: ServiceTypeView(petType: .dog)
                                .environmentObject(viewModel.rawModel)) {
                    Text("Dog")
                        .frame(width: 300, height: 70, alignment: .center)
                        .background(Color.buttonColor)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .cornerRadius(7)
                        .padding()
                }
                
                
                NavigationLink(destination: ServiceTypeView(petType: .cat)
                                .environmentObject(viewModel.rawModel)) {
                    Text("Cat")
                        .frame(width: 300, height: 70, alignment: .center)
                        .background(Color.buttonColor)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .cornerRadius(7)
                        .padding()
                }
                
                if !viewModel.rawModelIsEmpty {
                    Button(action: viewModel.calculate) {
                        Text(viewModel.calculateTitleString)
                    }
                    .frame(width: 300, height: 70, alignment: .center)
                    .background(Color.buttonColor)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .cornerRadius(7)
                    .padding()
                }
                
            }
        }
    }
}

