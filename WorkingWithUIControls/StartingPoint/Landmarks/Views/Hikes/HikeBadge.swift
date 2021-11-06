//
//  HikeBadge.swift
//  Landmarks
//
//  Created by 최동호 on 2021/11/05.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            // The badge does not have its own size.
            // Its drawing logic produces a result
            // that depends on the size of the frame in whidch it renders.
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
