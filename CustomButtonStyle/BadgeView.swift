//
//  BadgeView.swift
//  CustomButtonStyle
//
//  Created by Mohammad on 3/30/25.
//

import SwiftUI

struct PreviewView: View {
    var body: some View {
        Rectangle()
    }
}

struct PreviewBadgeView: View {
    var body: some View {
        ZStack {
            PreviewView()
                .foregroundStyle(.green)
            
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
            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .fill(.teal)
                    .frame(width: .infinity, height: 200)
                
                    PreviewBadgeView()
                    .frame(width: .infinity, height: size)
            }.clipped()
            
            Slider(value: $size, in: 0...200)
            Spacer()
        }
    }
}

#Preview {
    BadgeView()
}
