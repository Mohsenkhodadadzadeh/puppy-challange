//
//  CheckBoxToggleStyle.swift
//  puppy challange
//
//  Created by Mohsen on 10/27/22.
//

import SwiftUI

extension ToggleStyle where Self == CheckBoxToggleStyle {

    static var checkbox: CheckBoxToggleStyle {
        return CheckBoxToggleStyle()
    }
}

struct CheckBoxToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
