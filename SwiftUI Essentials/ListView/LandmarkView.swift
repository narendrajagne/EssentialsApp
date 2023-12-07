//
//  LandmarkView.swift
//  SwiftUI Essentials
//
//  Created by ERP on 30/11/2023.
//

import SwiftUI

struct LandmarkView: View {
    
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let landmarks = LandmarkData().landmarks
    return Group {
        LandmarkDetails(landmarks: landmarks[0])
        LandmarkDetails(landmarks: landmarks[1])
    }
}
