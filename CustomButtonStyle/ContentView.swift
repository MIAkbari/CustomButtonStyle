//
//  ContentView.swift
//  CustomButtonStyle
//
//  Created by Mohammad on 3/29/25.
//

import SwiftUI

enum ButtonStyleConstant {
    static let padding: CGFloat = 15
}

struct SocialButtonSetting {
    var iconName: String
    var color: Color
}

extension SocialButtonSetting: Equatable {} // for test equal

struct SocailStyleEnvironmentKey: EnvironmentKey {
    static var defaultValue: SocialButtonSetting = .init(iconName: "questionmark.circle", color: .clear)
}

extension EnvironmentValues {
    var socialStyle: SocialButtonSetting {
        get { self[SocailStyleEnvironmentKey.self] }
        set { self[SocailStyleEnvironmentKey.self] = newValue }
    }
}

struct SocailButtonViewModefier: ViewModifier {
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
        .background(style.color.gradient)
        .cornerRadius(8)
        .scaleEffect(isPressed ? 0.9 : 1)
        .animation(.smooth, value: isPressed)
        .frame(minWidth: 200, maxWidth: .infinity)
        .fixedSize(horizontal: false, vertical: true)
        .dynamicTypeSize(.xSmall ... .xxLarge)
    }
}

struct SocailButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label.modifier(SocailButtonViewModefier(isPressed: configuration.isPressed))
    }
}

extension ButtonStyle where Self == SocailButtonStyle {
    static var social: SocailButtonStyle { .init() }
}

extension View {
    func socialStyle(_ style: SocialButtonSetting) -> some View {
        environment(\.socialStyle, style)
    }
}
struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Sign in with Apple") {
                
            }
            .socialStyle(.init(iconName: "apple.logo", color: .black))
            .buttonStyle(.social)
            
            
            Button("Sign in with Google") {
                
            }
            .socialStyle(.init(iconName: "g.circle.fill", color: .red))
            .buttonStyle(.social)
            
            Button("Sign in with Facebook") {
                
            }
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
