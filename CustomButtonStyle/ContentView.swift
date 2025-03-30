//
//  ContentView.swift
//  CustomButtonStyle
//
//  Created by Mohammad on 3/29/25.
//

import SwiftUI

import SwiftUI

enum ButtonStyleConstant {
    static let padding: CGFloat = 15
}

struct SocialButtonSetting {
    var iconName: String
    var color: Color
}

extension SocialButtonSetting: Equatable {}

struct SocialStyleEnvironmentKey: EnvironmentKey {
    static var defaultValue: SocialButtonSetting = .init(iconName: "questionmark.circle", color: .clear)
}

extension EnvironmentValues {
    var socialStyle: SocialButtonSetting {
        get { self[SocialStyleEnvironmentKey.self] }
        set { self[SocialStyleEnvironmentKey.self] = newValue }
    }
}

struct SocialButtonViewModifier: ViewModifier {
    let isPressed: Bool
    @Environment(\.socialStyle) var style
    
    func body(content: Content) -> some View {
        HStack {
            Image(systemName: style.iconName)
                .padding(.leading, ButtonStyleConstant.padding)
            
            content
                .font(.headline.weight(.medium))
                .padding(.vertical, ButtonStyleConstant.padding)
                .padding(.trailing, ButtonStyleConstant.padding)
        }
        .background(style.color)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
        .scaleEffect(isPressed ? 0.95 : 1)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
        .frame(minWidth: 200, maxWidth: .infinity)
        .fixedSize(horizontal: false, vertical: true)
        .dynamicTypeSize(.xSmall ... .xxLarge)
    }
}

struct SocialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(SocialButtonViewModifier(isPressed: configuration.isPressed))
    }
}

extension ButtonStyle where Self == SocialButtonStyle {
    static var social: SocialButtonStyle { .init() }
}

extension View {
    func socialStyle(_ style: SocialButtonSetting) -> some View {
        environment(\.socialStyle, style)
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Sign in with Apple") {}
                .socialStyle(.init(iconName: "apple.logo", color: .black))
                .buttonStyle(.social)
            
            Button("Sign in with Google") {}
                .socialStyle(.init(iconName: "g.circle.fill", color: .red))
                .buttonStyle(.social)
            
            Button("Sign in with Facebook") {}
                .socialStyle(.init(iconName: "f.circle.fill", color: .blue))
                .buttonStyle(.social)
        }
        .foregroundStyle(.white)
        .padding()
    }
}

#Preview {
    ContentView()
}
