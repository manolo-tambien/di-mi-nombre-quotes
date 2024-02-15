//
//  ContentView.swift
//  di-mi-nombre-quotes
//
//  Created by Manolo on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            // Render the QuoteView view sending the values for breaking bad tab
            QuoteView(show: Constants.bbName)
                .tabItem {
                    // Set the name of the tab and the icon
                    Label(Constants.bbName, systemImage: "tortoise")
                }
            // Render the QuoteView view sending the value for a Better call saul tab
            QuoteView(show: Constants.bcsName)
                .tabItem {
                    Label(Constants.bcsName, systemImage: "briefcase")
                }
        }
        .onAppear{
            UITabBar.appearance().scrollEdgeAppearance =
            UITabBarAppearance()
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
