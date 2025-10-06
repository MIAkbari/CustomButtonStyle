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
                .padding(.horizontal, 5)
            
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

struct ButtonView: View {
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

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Sign in with Apple") {}
                .socialStyle(.init(iconName: "g.circle.fill", color: .black))
                .buttonStyle(.social)
                .frame(maxWidth:  400)
            
            Button("Sign in with Google") {}
                .buttonStyle(.borderedProminent)

            Button("Sign in with Facebook") {}
                .buttonStyle(.borderedProminent)
        }
        .foregroundStyle(.white)
        .padding()
    }
}

#Preview {
    ContentView()
}

//import SwiftUI
//
//// MARK: - Constants
//private enum ButtonConstants {
//    static let padding: CGFloat = 16
//    static let cornerRadius: CGFloat = 10
//    static let minWidth: CGFloat = 200
//    static let shadowRadius: CGFloat = 4
//    static let pressedScale: CGFloat = 0.96
//}
//
//// MARK: - Data Model
//struct SocialButtonConfig {
//    var icon: String
//    var color: Color
//    var gradient: LinearGradient?
//    
//    static let apple = Self(
//        icon: "applelogo",
//        color: .black,
//        gradient: LinearGradient(
//            colors: [.black, .gray],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//    )
//    
//    static let google = Self(
//        icon: "g.circle.fill",
//        color: .red,
//        gradient: LinearGradient(
//            colors: [.red, .orange],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//    )
//    
//    static let facebook = Self(
//        icon: "f.circle.fill",
//        color: .blue,
//        gradient: LinearGradient(
//            colors: [.blue, .purple],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//    )
//}
//
//// MARK: - Environment Values
//private struct SocialButtonEnvironmentKey: EnvironmentKey {
//    static var defaultValue: SocialButtonConfig = .apple
//}
//
//extension EnvironmentValues {
//    var socialButtonConfig: SocialButtonConfig {
//        get { self[SocialButtonEnvironmentKey.self] }
//        set { self[SocialButtonEnvironmentKey.self] = newValue }
//    }
//}
//
//// MARK: - Button Components
//struct SocialButton: View {
//    let title: String
//    let action: () -> Void
//    
//    var body: some View {
//        Button(action: action) {
//            HStack(spacing: ButtonConstants.padding) {
//                iconView
//                textView
//            }
//            .socialButtonStyle()
//        }
//        .buttonStyle(SocialButtonPressStyle())
//    }
//    
//    private var iconView: some View {
//        Image(systemName: config.icon)
//            .font(.title2)
//            .foregroundColor(.white)
//    }
//    
//    private var textView: some View {
//        Text(title)
//            .font(.headline)
//            .fontWeight(.semibold)
//    }
//    
//    @Environment(\.socialButtonConfig) private var config
//}
//
//// MARK: - Button Styles
//private struct SocialButtonPressStyle: ButtonStyle {
//    @Environment(\.isEnabled) private var isEnabled
//    
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .scaleEffect(configuration.isPressed ? ButtonConstants.pressedScale : 1)
//            .animation(.interactiveSpring(response: 0.3), value: configuration.isPressed)
//            .opacity(isEnabled ? 1 : 0.6)
//    }
//}
//
//private struct SocialButtonBaseStyle: ViewModifier {
//    @Environment(\.socialButtonConfig) private var config
//    
//    func body(content: Content) -> some View {
//        content
//            .foregroundColor(.white)
//            .padding(ButtonConstants.padding)
//            .frame(minWidth: ButtonConstants.minWidth)
//            .background(backgroundView)
//            .cornerRadius(ButtonConstants.cornerRadius)
//            .shadow(
//                color: Color.black.opacity(0.1),
//                radius: ButtonConstants.shadowRadius,
//                x: 0,
//                y: 2
//            )
//    }
//    
//    @ViewBuilder
//    private var backgroundView: some View {
//        if let gradient = config.gradient {
//             gradient
//        } else {
//             config.color
//        }
//    }
//}
//
//// MARK: - View Extensions
//extension View {
//    func socialButtonStyle() -> some View {
//        modifier(SocialButtonBaseStyle())
//    }
//    
//    func socialButtonConfig(_ config: SocialButtonConfig) -> some View {
//        environment(\.socialButtonConfig, config)
//    }
//}
//
//// MARK: - Main View
//struct ContentView: View {
//    var body: some View {
//        VStack(spacing: ButtonConstants.padding) {
//            SocialButton(title: "Sign in with Apple", action: {})
//                .socialButtonConfig(.apple)
//            
//            SocialButton(title: "Sign in with Google", action: {})
//                .socialButtonConfig(.google)
//            
//            SocialButton(title: "Sign in with Facebook", action: {})
//                .socialButtonConfig(.facebook)
//        }
//        .padding()
//        .background(Color(.systemBackground))
//    }
//}
//
//// MARK: - Preview
//struct AuthenticationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

