//
//  LandmarkDetails.swift
//  SwiftUI Essentials
//
//  Created by ERP on 30/11/2023.
//

import SwiftUI

struct LandmarkDetails: View {
    
    @Environment(LandmarkData.self) var modelData
    
    var landmarks: Landmark
        
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmarks.id})!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: landmarks.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: landmarks.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmarks.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmarks.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmarks.state)
                        .font(.subheadline)
                }
                Divider()
                Text("About \(landmarks.name)")
                    .font(.title2)
                Text(landmarks.description)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmarks.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = LandmarkData()
    return LandmarkDetails(landmarks: modelData.landmarks[0]).environment(modelData)
}
