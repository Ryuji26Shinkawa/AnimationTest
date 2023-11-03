//
//  ReversiRotation.swift
//  AnimationTest
//
//  Created by 新川竜司 on 2023/11/04.
//

import SwiftUI

struct ReversiRotation: View {
    /// 黒か白かを決める状態変数
    @State private var willColorAnimate = false
    /// 表か裏かを決める状態変数
    @State private var willRotateAnimate = false
    /// コマの状態を決める変数 false: 白, true: 黒
    @State private var pieceColor = false
    
    var body: some View {
        ZStack {
            Color.green
            VStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(pieceColor ? .white : .black)
                    .foregroundColor(pieceColor ? .white : .black)
                    .rotation3DEffect(Angle(degrees: pieceColor ? 0 : 180),
                                      axis: (x: 0, y: 1, z: 0),
                                      perspective: 0)
                HStack {
                    Button("白") {
                        withAnimation(.default) {
                            pieceColor.toggle()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ReversiRotation()
}
