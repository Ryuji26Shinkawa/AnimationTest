//
//  ContentView.swift
//  AnimationTest
//
//  Created by 新川竜司 on 2023/11/03.
//

import SwiftUI

struct ContentView: View {
    @State var isResetting = false
    @State var circleCenter = CGPoint.zero
    @State var isCircleScaled = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .scaleEffect(isCircleScaled ? 2 : 1)
                    .animation(isResetting ? nil : .easeInOut, value: isCircleScaled)
                    .offset(x: circleCenter.x - 25, y: circleCenter.y - 25)
                    .animation(isResetting ? nil : .spring(response: 0.3, dampingFraction: 0.1), value: circleCenter)
                    .gesture(
                        DragGesture(minimumDistance: 0).onChanged { value in
                            //                        withAnimation(.spring(response: 0.3, dampingFraction: 0.1)) {
                            circleCenter = value.location
                            //                        }
                        }
                    )
                
                Toggle(
                    "Scale",
                    isOn: $isCircleScaled.animation(.easeInOut)
                )
                
                Button("Reset") {
                    circleCenter = .zero
                    isCircleScaled = false
                }
                
                NavigationLink("カピ通信　3DEffect") {
                    SecondView()
                }
                
                NavigationLink("リバーシの回転") {
                    ReversiRotation()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
