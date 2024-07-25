//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Kate Alvarez on 7/25/24.
//

import SwiftUI

struct ScrumsView: View {
    // defining constant
    let scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                
                // creates links to new views
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
                
            }
            .navigationTitle("Daily Scrums") // title of page
            
            // tool bar at the top
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
