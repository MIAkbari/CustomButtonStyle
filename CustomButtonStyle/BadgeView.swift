//
//  BadgeView.swift
//  CustomButtonStyle
//
//  Created by Mohammad on 3/30/25.
//

import SwiftUI

struct PreviewBadgeView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.yellow)
            
            Text("Preview")
                .font(.headline.weight(.heavy))
                .foregroundStyle(.white)
        }
    }
}

struct BadgeView: View {
    @State var size: CGFloat = 100
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image(.preview)
                    .resizable()
                    .clipped()
                    .frame(width: .infinity, height: 250)
                PreviewBadgeView()
                    .frame(width: 100, height: size)
            }
            
            Slider(value: $size.animation(), in: 0...200)
            
            Spacer()
        }
    }
}

#Preview {
    BadgeView()
}
