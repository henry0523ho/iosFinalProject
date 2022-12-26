//
//  tetrioPage.swift
//  iosFinalProject
//
//  Created by User10 on 26/12/22.
//

import SwiftUI

struct tetrioPage: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: tetrioFindUserPage(),
                    label: {
                        Text("Find user")
                    })
            }.navigationTitle("Tetr.io")
            
        }
    }
}

struct tetrioPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            tetrioPage()
        }
    }
}
