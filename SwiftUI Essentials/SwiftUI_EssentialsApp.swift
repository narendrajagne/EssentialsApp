//
//  SwiftUI_EssentialsApp.swift
//  SwiftUI Essentials
//
//  Created by ERP on 30/11/2023.
//

import SwiftUI

@main
struct SwiftUI_EssentialsApp: App {
    
    @State private var modelData = LandmarkData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
