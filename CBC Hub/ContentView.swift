//
//  ContentView.swift
//  CBC Hub
//
//  Created by Henry Goldrich on 2/23/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RowerHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            BoatBoard()
                .tabItem {
                    Label("Boats", systemImage: "ferry.fill")
                }

            ErgLog()
                .tabItem {
                    Label("Log", systemImage: "chart.bar")
                }

            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }

            Text("More")
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
        }
        .tint(Color(hex: "15803d"))
    }
}

#Preview {
    ContentView()
}
