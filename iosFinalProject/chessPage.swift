//
//  chessPage.swift
//  iosFinalProject
//
//  Created by User10 on 27/12/22.
//

import SwiftUI

struct chessPage: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: chessLeaderBoard(),
                    label: {
                        Text("LeaderBoard")
                    })
            }.navigationTitle("Chess")
            
        }
    }
}

struct chessPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            chessPage()
        }
    }
}
