//
//  RobotViewModel.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 3/2/2022.
//


import Foundation
import Combine


class RobotViewModel: ObservableObject {
    
    @Published var column = -1
    @Published var row = -1
    @Published var direction: Direction = .east
    @Published var isRobotPlaced: Bool = false
    @Published var isWrongAttempt: Bool = false
    
   
    var report: String {
        return "\(self.row), \(self.column), \(self.direction.string)"
    }
    public func placeRobot(xPoint:Int, yPoint:Int, direction:Direction){
        
        self.column = xPoint
        self.row = yPoint
        self.direction = direction
        
        isRobotPlaced = true
    }
    
    func processCommand(_ command: Command) {
        switch command {
            case .left: turnLeft()
            case .right: turnRight()
            case .move:  move()
        }
    }
    
    private func turnRight(){
        if (direction.rawValue + 1) > Direction.north.rawValue {
            direction = .east
        } else {
            direction = Direction(rawValue: direction.rawValue + 1)!
        }
    }
    
    private func turnLeft(){
       
        if (direction.rawValue - 1) < Direction.east.rawValue {
            direction = .north
        } else {
            direction = Direction(rawValue: direction.rawValue - 1)!
        }
    }
    
    private func move() {
        
        if (direction == .east && column != (tableSize - 1) && column >= 0) {
            column += 1
        } else if (direction == .south && row != 0 && row >= 0) {
            row -= 1
        } else if (direction == .west && column != 0 && column >= 0) {
            column -= 1
        } else  if (direction == .north && row != (tableSize - 1) && row >= 0) {
            row += 1
        } else {
            /// This will move robot out of the table, hence ignoring command
            print("Invalid move")
            isWrongAttempt = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.isWrongAttempt = false
            }
        }
    }
    
   
    
}
