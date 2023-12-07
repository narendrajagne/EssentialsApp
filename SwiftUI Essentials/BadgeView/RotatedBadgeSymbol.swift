//
//  RotatedBadgeSymbol.swift
//  SwiftUI Essentials
//
//  Created by ERP on 05/12/2023.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    let angle: Angle

    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
