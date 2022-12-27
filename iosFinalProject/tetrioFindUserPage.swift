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
    @State var userData=UserStruct(data: UserData(user: UserDataUser(username: "didnt get data", xp: 0) ))
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Text("Find a user by name")
                    TextField("user name", text: $userName).textCase(.lowercase).autocapitalization(.none)
                    Button(action: {fetchData()}, label: {
                        Text("search")
                    })
                    List{
                        Text("aaa")
                        tetrioUserView(test:$getData, userData: $userData)
                    }
                }
            }.navigationTitle("find user by name")
        }
        
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
            Text("user name:\(userData.data.user.username)")
            Text("user xp:\(userData.data.user.xp)")
        }
    }
}


struct tetrioFindUserPage_Previews: PreviewProvider {
    static var previews: some View {

            tetrioFindUserPage()

    }
}
