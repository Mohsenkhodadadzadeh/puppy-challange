//
//  View+textFieldAlert.swift
//  puppy challange
//
//  Created by Mohsen on 10/27/22.
//

import SwiftUI

extension View {

    func textFieldAlert(isShowing: Binding<Bool>,
                        outputNumber: Binding<Int>,
                        title: String) -> some View {
        TextFieldAlert(isShowing: isShowing,
                       outputNumber: outputNumber,
                       presenting: self,
                       title: title)
    }

}
