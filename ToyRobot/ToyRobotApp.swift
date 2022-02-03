//
//  ToyRobotApp.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 2/2/2022.
//

import SwiftUI

@main
struct ToyRobotApp: App {
    
    @StateObject private var robotViewModel = RobotViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(robotViewModel)
            //Wrong()
        }
    }
}
