//
//  ContentView.swift
//  Scrumdinger0
//
//  Created by Kate Alvarez on 7/24/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            // header progress bar
            ProgressView(value: 5, total: 15)
            
            // header information
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            // center circle
            Circle()
                .strokeBorder(lineWidth: 24)
            
            // bottom information
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action:{}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
            
        }
        .padding()

    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
