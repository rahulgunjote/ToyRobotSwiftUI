//
//  ContentView.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 2/2/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
        
    var body: some View {
        VStack {
            InputView()
                .padding(8)
            TableTopView()
                .padding(2)
            CommandView()
                .padding(8)
        }
        .background(Color("Color2").edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
