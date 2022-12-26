//
//  homePage.swift
//  iosFinalProject
//
//  Created by User10 on 26/12/22.
//

import SwiftUI

struct homePage: View {
    var body: some View {
        VStack{
            Text("期末作業").font(.largeTitle).fontWeight(.heavy).padding(.all)
            Button(action: {
                    
                }, label: {
                    Text("TETRIO").padding(.all).background(Color(red: 0.3, green: 0.3, blue: 0.5)).foregroundColor(Color(red: 0.9, green: 0.9, blue: 1.0))
                })
        }
    }
}

struct homePage_Previews: PreviewProvider {
    static var previews: some View {
        homePage()
    }
}
