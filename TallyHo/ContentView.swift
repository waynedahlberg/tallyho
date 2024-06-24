//
//  ContentView.swift
//  TallyHo
//
//  Created by Wayne Dahlberg on 6/23/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
  @StateObject private var counterManager = CounterManager()
  @State private var volumeObserver: VolumeButtonObserver?
  
  var body: some View {
    VStack {
      Text("\(counterManager.count)")
        .font(.system(size: 100, weight: .black))
        .padding()
      
      Button(action: {
        counterManager.increment()
      }) {
        Text("+1")
          .font(.system(size: 50))
          .frame(width: 200, height: 200)
          .foregroundStyle(.white)
          .background(Color.blue)
          .clipShape(Circle())
      }
    }
    .onAppear {
      volumeObserver = VolumeButtonObserver(counterManager: counterManager)
    }
  }
}

#Preview {
  ContentView()
}
