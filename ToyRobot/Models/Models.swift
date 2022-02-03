//
//  Models.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 3/2/2022.
//

import Foundation

let tableSize: Int = 6

enum Direction: Int, CaseIterable {
    case east = 1,
         south,
         west,
         north
    
    static var displayStrings: [String] {
        return ["East", "South", "West", "North"]
    }
    static func fromString(_ string: String) -> Direction {
        switch string {
            case "East":
                return .east
            case "South":
                return .south
            case "West":
                return .west
            case "North":
                return .north
            default:
                return .east
        }
    }
    var string: String {
        switch self {
            case .east:
                return "EAST"
            case .south:
                return "SOUTH"
            case .west:
                return "WEST"
            case .north:
                return "NORTH"
        }
    }
    var initialRotationAngle: Double {
        switch self {
            case .east:
                return 0
            case .south:
                return 90
            case .west:
                return 180
            case .north:
                return 270
          
        }
    }
}

enum Command: Int {
    case left,
    right,
    move
}
