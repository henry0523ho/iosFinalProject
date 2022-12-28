//
//  ContentView.swift
//  iosFinalProject
//
//  Created by User10 on 26/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var tag:Int=1
    var body: some View {
        TabView(selection:$tag){
            tetrioPage().tabItem {
                Label("俄羅斯方塊", systemImage: "gamecontroller.fill")
                
            }.tag(1)
            //clashPage().tabItem { Label("Clash of Clane", systemImage: "star" )}
            chessPage().tabItem { Label("Chess", systemImage: "person.fill") }.tag(2)
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
