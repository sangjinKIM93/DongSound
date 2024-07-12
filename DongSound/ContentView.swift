//
//  ContentView.swift
//  DongSound
//
//  Created by 김상진 on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button {
                MusicPlayer.shared.playSound()
            } label: {
                Text("음악 재생")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
