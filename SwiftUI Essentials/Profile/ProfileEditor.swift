//
//  ProfileEditor.swift
//  SwiftUI Essentials
//
//  Created by ERP on 07/12/2023.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile : Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goaldate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goaldate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotification) {
                Text("Enable Notification").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Seasonal Photos").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            DatePicker(selection: $profile.goaldate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
