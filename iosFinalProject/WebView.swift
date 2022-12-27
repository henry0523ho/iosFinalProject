//
//  WebView.swift
//  iosFinalProject
//
//  Created by User10 on 27/12/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    var username:String
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
//        var query="https://jstris.jezevec10.com/u/"
//        query.append(username)
//        if let url = URL(string: query) {
//            let request = URLRequest(url: url)
//            webView.load(request)
//        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        var query="https://jstris.jezevec10.com/u/"
        query.append(username)
        if let url = URL(string: query) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    typealias UIViewType = WKWebView
    
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(username: "henry0523ho")
    }
}
