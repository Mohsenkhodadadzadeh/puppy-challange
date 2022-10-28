//
//  puppy_challangeApp.swift
//  puppy challange
//
//  Created by Mohsen on 10/26/22.
//

import SwiftUI

@main
struct puppy_challangeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PetTypeView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
