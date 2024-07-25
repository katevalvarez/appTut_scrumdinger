//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kate Alvarez on 7/24/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            // initial view is scrumsView
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
