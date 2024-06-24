//
//  VolumeButtonObserver.swift
//  TallyHo
//
//  Created by Wayne Dahlberg on 6/23/24.
//

import SwiftUI
import AVFoundation

class VolumeButtonObserver: NSObject {
  private let counterManager: CounterManager
  
  init(counterManager: CounterManager) {
    self.counterManager = counterManager
    super.init()
    setupVolumeButtonHandling()
  }
  
  private func setupVolumeButtonHandling() {
    let audioSession = AVAudioSession.sharedInstance()
    do {
      try audioSession.setActive(true)
      try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers])
      audioSession.addObserver(self, forKeyPath: "outputVolume", options: [.new], context: nil)
    } catch {
      print("Failed to set up audio session: \(error.localizedDescription)")
    }
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "outputVolume" {
      DispatchQueue.main.async {
        self.counterManager.increment()
      }
    }
  }
}
