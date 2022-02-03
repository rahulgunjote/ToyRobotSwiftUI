//
//  InputViewModel.swift
//  ToyRobot
//
//  Created by Rahul Gunjote on 3/2/2022.
//

import Foundation
import Combine

class InputViewModel: ObservableObject {
  // input
  @Published var xPositionText = ""
  @Published var yPositionText = ""
  @Published var direction = "East"

  // output
  @Published var isValidXPosition = false
  @Published var isValidYPosition = false
  @Published var isValid = false

  private var cancellableSet: Set<AnyCancellable> = []
  
  private var isXPositionValidPublisher: AnyPublisher<Bool, Never> {
    $xPositionText
      .debounce(for: 0.4, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { input in
          guard let intValue = Int(input) , (0..<6).contains(intValue) else {
              return false
          }
          return true
      }
      .eraseToAnyPublisher()
  }
  
  private var isYPositionValidPublisher: AnyPublisher<Bool, Never> {
    $yPositionText
          .debounce(for: 0.4, scheduler: RunLoop.main)
          .removeDuplicates()
          .map { input in
              guard let intValue = Int(input) , (0..<6).contains(intValue) else {
                  return false
              }
              return true
          }
          .eraseToAnyPublisher()
  }
  
  private var isValidPublisher: AnyPublisher<Bool, Never> {
    Publishers.CombineLatest(isXPositionValidPublisher, isYPositionValidPublisher)
      .map { isValidX, isValidY in
        return isValidX && isValidY
      }
    .eraseToAnyPublisher()
  }
  
  init() {
    isXPositionValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.isValidXPosition, on: self)
      .store(in: &cancellableSet)
    
    isYPositionValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.isValidYPosition, on: self)
      .store(in: &cancellableSet)

    isValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.isValid, on: self)
      .store(in: &cancellableSet)
  }

}

