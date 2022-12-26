//
//  clashPage.swift
//  iosFinalProject
//
//  Created by User10 on 26/12/22.
//

import SwiftUI

struct clashPage: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: homePage(),
                    label: {
                        Text("Clash of clane")
                    })
            }.navigationTitle("Clash of clane")
            
        }
    }
}

struct clashPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            clashPage()
        }
    }
}
