//
//  AppButtonView.swift
//  CustomButtonStyle
//
//  Created by Mohammad on 10/8/25.
//

import SwiftUI


public enum ButtonConstantsApp {
    static let padding: CGFloat = 16
    static let corenrRadius: CGFloat = 10
    static let minWidth: CGFloat = 200
    static let shadowRadius: CGFloat = 4
    static let pressedScale: CGFloat = 0.96
}

struct SocialButtonConigApp {
    var icon: String
    var color: Color
    var gradiantLayer: LinearGradient?
    
    // Apple Example
    static let apple = Self (
        icon: "apple.logo",
        color: .black,
        gradiantLayer: nil
    )
    
    static let google = Self (
        icon: "g.circle.logo",
        color: .red,
        gradiantLayer: nil
    )
}

private struct SocialButtonEnvironmentKeyApp: EnvironmentKey {
    static var defaultValue: SocialButtonConigApp = .apple
}

extension EnvironmentValues {
    var socailButtonConfigApp: SocialButtonConigApp {
        get { [SocialButtonConigApp].self }
        set { [SocialButtonConigApp].self = newValue }
    }
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
