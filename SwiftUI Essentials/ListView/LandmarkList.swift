//
//  LandmarkList.swift
//  SwiftUI Essentials
//
//  Created by ERP on 30/11/2023.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(LandmarkData.self) var modelData
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks, id: \.id) { landmark in
                    NavigationLink {
                        LandmarkDetails(landmarks: landmark)
                    } label: {
                        LandmarkView(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmarks")
        }
    }
}

#Preview {
    LandmarkList().environment(LandmarkData())
}
