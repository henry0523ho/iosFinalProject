//
//  ContentView.swift
//  iosFinalProject
//
//  Created by User10 on 26/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            tetrioPage().tabItem { Label("Tetrio", systemImage: "star") }
            clashPage().tabItem { Label("Clash of Clane", systemImage: "star" )}
            chessPage().tabItem { Label("Chess.com", systemImage: "star") }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
