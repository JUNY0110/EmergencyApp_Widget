//
//  EmergencyAppApp.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/26.
//

import SwiftUI

@main
struct EmergencyApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            EmergencyTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
}


