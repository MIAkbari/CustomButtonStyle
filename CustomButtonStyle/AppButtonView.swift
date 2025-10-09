//
//  AppButtonView.swift
//  CustomButtonStyle
//
//  Created by Mohammad on 10/8/25.
//

import SwiftUI


struct KeyOFChangeBase: EnvironmentKey {
    static var defaultValue: Int = 10
}


struct AppButtonView: View {
    var body: some View {
        ZStack {
            VStack {
                Button("Sign With Apple") {}
                    .frame(maxWidth: 600)
                    .background(.blue)
//                    .socialStyle(.init(iconName: "apple.logo", color: .black))
//                    .buttonStyle(.social)
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    AppButtonView()
}
