//
//  chessLeaderBoard.swift
//  iosFinalProject
//
//  Created by User10 on 27/12/22.
//

import SwiftUI

struct chessLeaderBoard: View {
    @State var myData=ChessStruct(daily: [ChessItem]())
    //var updateTimer:Timer?
    var body: some View {
        VStack{
        Text("排行榜")
        List{
            HStack{
                Text("玩家名稱").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Divider()
                Text("勝場數").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Divider()
                Text("平局").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Divider()
                Text("敗場數").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            ForEach(self.myData.daily){
//                item in Text("\(item.username)" as String)
                item in chessUserView(userData:item)
            }
        }.onAppear(perform: {
            //updateTimer=Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: fetchData)
            fetchData()
        }).onDisappear(perform: {
            
        })
//        let col=Array(repeating: GridItem(), count: 4)
//        ScrollView{
//            LazyVGrid(columns: col, content: {
//                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
//                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
//            })
//        }.onAppear(perform: {
//            fetchData()
//        })
        }
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

struct chessUserView: View{
    var userData:ChessItem
    var body: some View{
        HStack{
            Group{
                Text("\(userData.username)")
                Text("\(userData.win_count)")
                Text("\(userData.draw_count)")
                Text("\(userData.loss_count)")
            }.lineLimit(1)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

struct chessLeaderBoard_Previews: PreviewProvider {
    static var previews: some View {
        chessLeaderBoard()
    }
}
