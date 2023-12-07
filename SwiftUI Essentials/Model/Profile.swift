//
//  Profile.swift
//  SwiftUI Essentials
//
//  Created by ERP on 07/12/2023.
//

import Foundation

struct Profile {
    
    var username: String
    var prefersNotification = true
    var seasonalPhoto = Season.winter
    var goaldate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍁"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
