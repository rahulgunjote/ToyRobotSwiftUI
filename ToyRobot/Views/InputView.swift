//
//  InputView.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 3/2/2022.
//

import SwiftUI

struct InputView: View {
    
    @ObservedObject private var inputViewModel = InputViewModel()
    @EnvironmentObject var robotViewModel: RobotViewModel

    var body: some View {
        VStack {
            HStack {
                Text("X Position")
                TextField("Enter value between 0 to 5", text: $inputViewModel.xPositionText)
                    .autocapitalization(.none)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(inputViewModel.isValidXPosition ? Color.green : Color.red, lineWidth: 1)
                    )
            }
            
            HStack {
                Text("Y Position")
                TextField("Enter value between 0 to 5", text: $inputViewModel.yPositionText)
                    .autocapitalization(.none)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(inputViewModel.isValidYPosition ? Color.green : Color.red, lineWidth: 1)
                    )
            }
            
            Picker("Choose direction", selection: $inputViewModel.direction) {
                ForEach(Direction.displayStrings, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            Button(action: {
                hideKeyboard()
                robotViewModel.placeRobot(xPoint: Int(inputViewModel.xPositionText)!,
                                          yPoint: Int(inputViewModel.yPositionText)!,
                                          direction: Direction.fromString(inputViewModel.direction))
            }) {
                Text("Place Robot")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(self.inputViewModel.isValid ? 1 : 0.2))
            .cornerRadius(10.0)
            .disabled(!self.inputViewModel.isValid)
            
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
