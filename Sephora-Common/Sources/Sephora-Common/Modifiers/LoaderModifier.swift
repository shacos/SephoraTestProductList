//
//  loaderModifier.swift
//  Sephora-Common
//
//  Created by Mehdi on 12/1/2026.
//

import SwiftUI

public struct LoaderModifier: ViewModifier {
    @Binding var showLoader: Bool
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(showLoader)
            
            ProgressView()
                .controlSize(.large)
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showLoader ? 1 : 0)
                .animation(.linear(duration: 0.5), value: showLoader)
        }
    }
}

extension View {
    public func loadingConfig(show: Binding<Bool>) -> some View {
        self.modifier(LoaderModifier(showLoader: show))
    }
}
