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
                .fill(.red)
            
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
            ZStack(alignment: .top){
                Rectangle()
                    .fill(.teal)
                    .frame(width: .infinity, height: 200)
                
                PreviewBadgeView()
                    .frame(width: .infinity, height: size)
            }
            Slider(value: $size, in: 0...200)
            Spacer()
        }
    }
}

#Preview {
    BadgeView()
}
