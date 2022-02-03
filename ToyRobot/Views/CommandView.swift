//
//  CommandView.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 3/2/2022.
//

import SwiftUI

struct CommandView: View {
    
    @EnvironmentObject var robotViewModel: RobotViewModel

    @State private var showReport = false

    var body: some View {
        HStack {
            Button {
                robotViewModel.processCommand(.left)
            } label: {
                Text("LEFT")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(robotViewModel.isRobotPlaced ? 1 : 0.2))
            .cornerRadius(10.0)
            .disabled(!robotViewModel.isRobotPlaced)
            
            Button {
                robotViewModel.processCommand(.right)
            } label: {
                Text("RIGHT")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(robotViewModel.isRobotPlaced ? 1 : 0.2))
            .cornerRadius(10.0)
            .disabled(!robotViewModel.isRobotPlaced)
            
            Button {
                withAnimation(.easeIn) {
                    robotViewModel.processCommand(.move)
                }
            } label: {
                Text("MOVE")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(robotViewModel.isRobotPlaced ? 1 : 0.2))
            .cornerRadius(10.0)
            .disabled(!robotViewModel.isRobotPlaced)
            
            Button {
                showReport = true
            } label: {
                Text("REPORT")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(robotViewModel.isRobotPlaced ? 1 : 0.2))
            .cornerRadius(10.0)
            .disabled(!robotViewModel.isRobotPlaced)
            .alert(isPresented: $showReport) {
                Alert(title: Text("Report"), message: Text("You are at position \(robotViewModel.row), \(robotViewModel.column), \(Direction.displayStrings[robotViewModel.direction.rawValue - 1])"), dismissButton: .default(Text("Got it!")))
            }
            
            
        }
    }
}

struct CommandView_Previews: PreviewProvider {
    static var previews: some View {
        CommandView()
    }
}
