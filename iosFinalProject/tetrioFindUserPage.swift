//
//  tetrioFindUserPage.swift
//  iosFinalProject
//
//  Created by User10 on 26/12/22.
//

import SwiftUI

struct tetrioFindUserPage: View {
    @State var userName:String=""
    @State var getData:String=""
    @State var userData=UserStruct(data: UserData(user: UserDataUser(username: "didnt get data", xp: 0,league: userLeague(gamesplayed: 0, gameswon: 0, rating: 0, glicko: 0, bestrank: "z", apm: 0, pps: 0)) ))
    @State var showAlert=false
    var body: some View {
//        NavigationView{
            VStack{
                Form{
                    HStack{
                        Text("user name:")
                        TextField("user name", text: $userName).textCase(.lowercase).autocapitalization(.none)
                        Button(action: {fetchData()}, label: {
                            Text("search")
                        }).alert(isPresented: $showAlert, content: {
                            return Alert(title: Text("找不到玩家"))
                        })
                    }
                    
                    List{
                        tetrioUserView(test:$getData, userData: $userData)
                    }
                }
            }.navigationTitle("Tetr.io玩家搜尋")
//        }
        
    }
    func fetchData(){
        var query = "https://ch.tetr.io/api/users/"
        query.append(userName)
        if let urlStr = query.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed) {
                    if let url = URL(string: urlStr) {
                        URLSession.shared.dataTask(with: url) { (data, response, error) in
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
                            if let data = data, let res = try? decoder.decode(UserStruct.self, from: data) {
                                self.userData=res
                                print(res.data.user.username)
                            } else {
                                showAlert=true
                                print("error")
                            }
                            
                            
//                            if let data=data {
//                                getData=String(data:data, encoding: .utf8)!
//                            }
                            
                        }.resume()
                    }
                }
    }
}

struct tetrioUserView: View {
    @Binding var test:String
    @Binding var userData:UserStruct
    var body: some View{
        List{
            HStack{
                Text("項目").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Divider()
                Text("資料").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            twoColView(title: "使用者名稱:", content: "\(userData.data.user.username)")
            twoColView(title: "XP:", content: "\(userData.data.user.xp)")
            twoColView(title: "排位場數:", content: "\(userData.data.user.league.gamesplayed)")
            twoColView(title: "排位勝場:", content: "\(userData.data.user.league.gameswon)")
//            twoColView(title: "排位積分:", content: "\(userData.data.user.league.rating)")
            ProgressView("排位積分:\(userData.data.user.league.rating,specifier: "%.2f")", value: (userData.data.user.league.rating/25000))
            twoColView(title: "技術評分:", content: "\(userData.data.user.league.glicko)")
            twoColView(title: "APM:", content: "\(userData.data.user.league.apm)")
            twoColView(title: "PPS:", content: "\(userData.data.user.league.pps)")
            Text("最高等級:\(userData.data.user.league.bestrank)")
        }
    }
}

struct twoColView: View{
    var title:String
    var content:String
    var body: some View{
        HStack{
            Group{
                Text("\(title)")
                Text("\(content)")
            }.lineLimit(1)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
    }
}


struct tetrioFindUserPage_Previews: PreviewProvider {
    static var previews: some View {

            tetrioFindUserPage()

    }
}
