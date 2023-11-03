//
//  SecondView.swift
//  AnimationTest
//
//  Created by 新川竜司 on 2023/11/03.
//

import SwiftUI

struct SecondView: View {
    @State private var angle = Angle(degrees: 0.0)  // 回転角度
    @State private var axisX: CGFloat = 0.0         // 回転軸のX座標
    @State private var axisY: CGFloat = 0.0         // 回転軸のY座標
    @State private var axisZ: CGFloat = 0.0         // 回転軸のZ座標
    @State private var anchorZ: CGFloat = 0.0       // 回転中心の奥行き位置
    @State private var perspective: CGFloat = 1.0   // 遠近法効果強度
    
    var body: some View {
        ZStack {
            /// タイトルプレート表示
            Text("カピ通信")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
                .rotation3DEffect(angle,
                                  axis: (x: axisX, y: axisY, z: axisZ),
                                  anchorZ: anchorZ,
                                  perspective: perspective)
            
            /// パラメータリセットボタン
            VStack {
                Button("Reset") {
                    self.angle.degrees = 0.0
                    self.axisX = 0.0
                    self.axisY = 0.0
                    self.axisZ = 0.0
                    self.anchorZ = 0.0
                    self.perspective = 1.0
                }.padding()
                Spacer()
            }
            
            /// 角度調整
            HStack {
                VStack {
                    Spacer()
                    Text("角度:\(angle.degrees, specifier: "%.2f")")
                    Slider(value: $angle.degrees, in: -180...180)
                }.padding()
                Spacer(minLength: 250)
            }
            
            /// 回転軸調整
            HStack {
                Spacer()
                VStack {
                    Text("X:\(axisX, specifier: "%.2f")")
                    Slider(value: $axisX, in: -1.0...1.0)
                    Text("Y:\(axisY, specifier: "%.2f")")
                    Slider(value: $axisY, in: -1.0...1.0)
                    Text("Z:\(axisZ, specifier: "%.2f")")
                    Slider(value: $axisZ, in: -1.0...1.0)
                    Text("anchorZ:\(anchorZ, specifier: "%.2f")")
                    Slider(value: $anchorZ, in: -100...100)
                    Text("perspective:\(perspective, specifier: "%.2f")")
                    Slider(value: $perspective, in: -10...10)
                }
                .frame(width: 200)
                .padding()
            }
        }
    }
}

#Preview {
    SecondView()
}
