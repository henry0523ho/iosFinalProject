//
//  chessLeaderBoard.swift
//  iosFinalProject
//
//  Created by User10 on 27/12/22.
//

import SwiftUI

struct chessLeaderBoard: View {
    @State var myData=ChessStruct(daily: [ChessItem]())
    
    var body: some View {
        List{
//            Button(action: {
//                fetchData()
//            }, label: {
//                Text("Button")
//            })
            ForEach(self.myData.daily){
                item in Text("\(item.username)" as String)
            }
        }.onAppear(perform: {
            fetchData()
        })
    }
    func fetchData(){
        let query = "https://api.chess.com/pub/leaderboards"
        if let urlStr = query.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed) {
                    if let url = URL(string: urlStr) {
                        URLSession.shared.dataTask(with: url) { (data, response, error) in
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
                            if let data = data, let res = try? decoder.decode(ChessStruct.self, from: data) {
                                self.myData=res
                                print(res.daily[0].username)
                            } else {
                                print("error")
                            }
                        }.resume()
                    }
                }
    }
}

struct chessLeaderBoard_Previews: PreviewProvider {
    static var previews: some View {
        chessLeaderBoard()
    }
}
