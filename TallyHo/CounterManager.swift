//
//  TallyManager.swift
//  TallyHo
//
//  Created by Wayne Dahlberg on 6/23/24.
//

import SwiftUI
import AVFoundation

class CounterManager: ObservableObject {
  @Published var count = 0
  
  func increment() {
    count += 1
    playHapticFeedback()
  }
  
  private func playHapticFeedback() {
    let impact = UIImpactFeedbackGenerator(style: .medium)
    impact.impactOccurred()
  }
}
