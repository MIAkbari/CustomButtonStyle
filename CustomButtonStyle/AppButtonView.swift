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
        get { self[SocialButtonEnvironmentKeyApp.self] }
        set { self[SocialButtonEnvironmentKeyApp.self] = newValue }
    }
}


struct SocialButtonViewModifierApp: ViewModifier {
    
    let isPressed: Bool
    @Environment(\.socailButtonConfigApp) var style 
    
    func body(content: Content) -> some View {
        HStack {
            Image(systemName: style.icon)
                .padding(.leading, ButtonConstantsApp.padding)
                .padding(.horizontal, 5)
            
            content
                .font(.headline.weight(.medium))
                .padding([.vertical, .trailing], ButtonConstantsApp.padding)
        }
        .background(style.color)
        .cornerRadius(ButtonConstantsApp.corenrRadius)
        .shadow(color: .black.opacity(0.2), radius: ButtonConstantsApp.shadowRadius, x: 0, y: ButtonConstantsApp.corenrRadius)
        .scaleEffect(isPressed ? ButtonConstantsApp.pressedScale : 0 )
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .fixedSize(horizontal: false, vertical: true)
        .dynamicTypeSize(.xSmall ... .xxLarge)
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
