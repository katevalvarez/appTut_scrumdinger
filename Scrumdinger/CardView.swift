//
//  CardView.swift
//  Scrumdinger
//
//  Created by Kate Alvarez on 7/24/24.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        // heading block
        VStack(alignment: .leading) {
        
            // heading
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            
            // meeting information
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)",systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            // background color not working
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}


