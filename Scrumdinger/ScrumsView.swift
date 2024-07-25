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
        List(scrums) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
