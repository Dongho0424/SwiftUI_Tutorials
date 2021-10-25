//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 최동호 on 2021/10/25.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // Way 1: make our data identifiable
        // -> Using KeyPath
//        List(landmarks, id: \Landmark.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        // Way 2: make our data identifiable
        // -> Making our data type confirm to the `Identifiable`
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 12 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
