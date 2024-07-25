//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Kate Alvarez on 7/25/24.
//

import SwiftUI


struct DetailEditView: View {
    
    // declares a state of the scrum we're currently editing
    @State private var scrum = DailyScrum.emptyScrum
    
    // declares a state for a new attendee
    @State private var newAttendeeName = ""
    
    var body: some View {
        
        // creates a form
        Form {
            Section(header: Text("Meeting Info")) {
                // text input, $ binds input to the scrum
                TextField("Title", text: $scrum.title)
                
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, 
                           in: 5...30,
                           step: 1) {
                        Text("Length") // only accessibility purposes
                    }
                   .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            }
            
            Section(header: Text("Attendees")) {
                // displays existing attendees
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                
                // defines action when you swipe to delete the row
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                
                // space for new attendees
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            // constant, defines new Attendee
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            
                            // adds new attendee to scrum
                            scrum.attendees.append(attendee)
                            
                            newAttendeeName = ""
                        }

                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    // disables button if its empty
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }

    }
}


struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}


