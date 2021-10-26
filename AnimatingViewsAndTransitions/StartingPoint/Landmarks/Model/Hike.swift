//
//  Hike.swift
//  Landmarks
//
//  Created by 최동호 on 2021/10/26.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation

struct Hike: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observations]
    
    static var formatter = LengthFormatter()
    
    var distanceText: String {
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observations: Codable, Hashable {
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
