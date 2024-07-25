//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Kate Alvarez on 7/25/24.
//

import SwiftUI
    
struct DetailView: View {
    let scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            // meeting info section
            Section(header: Text("Meeting Info")) {
                
                // link/button to meeting view
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                // length display
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                // theme display
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            // attendees section
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        // adds title to entire list
        .navigationTitle(scrum.title)
        .toolbar {
            // turns isPresentingEditView boolean true if pressed
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        // presents DetailEditView as a pop-up
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView()
                    .navigationTitle(scrum.title)
                
                    // creates toolbar in pop-up screen
                    .toolbar {
                        // cancel button
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        
                        // confirm button
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}
    
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}

