//
//  jstrisView.swift
//  iosFinalProject
//
//  Created by User10 on 27/12/22.
//

import SwiftUI
import WebKit

struct jstrisView: View {
    @State var username:String=""
    var body: some View {
        VStack{
            Text("Jstris玩家搜尋")
            TextField("username", text: $username).textCase(.lowercase).autocapitalization(.none)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            WebView(username: username).frame(height: .infinity)
        }
    }
}



struct jstrisView_Previews: PreviewProvider {
    static var previews: some View {
        jstrisView()
    }
}
