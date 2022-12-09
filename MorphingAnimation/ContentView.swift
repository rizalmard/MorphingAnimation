//
//  ContentView.swift
//  MorphingAnimation
//
//  Created by Rizal Muhammad on 09/12/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isPlay: Bool = false
    @State private var isStop: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: isStop ? 30 : 5)
                    .frame(width: isStop ? 60 : 250, height: 60)
                    .foregroundStyle(isStop ? Color.red.gradient : Color.green.gradient)
                    .overlay {
                        Image(systemName: isStop ? "mic.slash.fill" : "mic.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .scaleEffect(isPlay ? 0.7 : 1)
                    }
                
                RoundedRectangle(cornerRadius: isStop ? 35 : 10)
                    .trim(from: 0, to: isStop ? 0.0001 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: isStop ? 70 : 260, height: 70)
                    .foregroundColor(isStop ? .red : .green)
                
            } // ZSTACK
            .padding()
            .onTapGesture {
                withAnimation(Animation.spring()) {
                    isStop.toggle()
                }
                
                withAnimation(Animation.spring().repeatForever().delay(0.7).speed(0.8)) {
                    isPlay.toggle()
                }
            }
            
            Text(isPlay ? "Recording..." : "")
                .opacity(isPlay ? 0.4 : 0)
            
        } // SCROLLVIEW
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
