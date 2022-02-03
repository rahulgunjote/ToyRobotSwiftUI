//
//  TableTopView.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 3/2/2022.
//

import SwiftUI

struct TableTopView: View {
    
    @EnvironmentObject var robotViewModel: RobotViewModel
    
    var tileSize: CGFloat {
        let size = (UIScreen.main.bounds.size.width - 40) / CGFloat(tableSize)
        return size
    }
    var body: some View {
        
        VStack(spacing:2) {
            ForEach((0..<tableSize).reversed(), id: \.self) { row in
                HStack(spacing:2) {
                    ForEach(0..<tableSize) { column in
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("Color3"))
                            
                            if robotViewModel.column == column , robotViewModel.row == row {
                                HStack {
                                    Image("robot")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .offset(x: robotViewModel.isWrongAttempt ? -10 : 0)
                                        .animation(Animation.default.repeatCount(5))
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                        .rotationEffect(Angle.degrees(robotViewModel.direction.initialRotationAngle))
                                }
                            }
                        }
                        .cornerRadius(5.0)
                    }
                    
                }
                
            }
        }
    }
}

struct TableTopView_Previews: PreviewProvider {
    static var previews: some View {
        TableTopView()
    }
}
