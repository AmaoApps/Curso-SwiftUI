//
//  cocktelitoApp.swift
//  cocktelito
//
//  Created by Paku on 13/06/21.
//

import SwiftUI

@main
struct cocktelitoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).edgesIgnoringSafeArea(.all)
        }
    }
}
