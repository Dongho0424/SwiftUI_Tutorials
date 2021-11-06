//
//  FeatureCard.swift
//  Landmarks
//
//  Created by 최동호 on 2021/11/06.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
//        ZStack {
//            landmark.featureImage?
//                .resizable()
//                .aspectRatio(3 / 2, contentMode: .fit)
//            TextOverlay(landmark: landmark)
//        }
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            // gradient 때문에 overlay 쓴 것.
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        LinearGradient.linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0.0)]),
                                      startPoint: .bottom,
                                      endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
