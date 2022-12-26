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
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Text("Find a user by name")
                    TextField("user name", text: $userName)
                    Button(action: {fetchData()}, label: {
                        Text("search")
                    })
                    List{
                        Text("aaa")
                        tetrioUserView(userData: $getData)
                    }
                }
            }.navigationTitle("find user by name")
        }
        
    }
    func fetchData(){
        let query = "https://ch.tetr.io/api/users/henry0523ho"
        if let urlStr = query.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed) {
                    if let url = URL(string: urlStr) {
                        URLSession.shared.dataTask(with: url) { (data, response, error) in
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
//                            if let data = data, let busResults = try? decoder.decode(UserStruct.self, from: data) {
//                                getData=data
//                            } else {
//                                print("error")
//                            }
                            if let data=data {
                                getData=String(data:data, encoding: .utf8)!
                            }
                            
                        }.resume()
                    }
                }
    }
}

struct tetrioUserView: View {
    @Binding var userData:String
    var body: some View{
        VStack{
            Text(userData)
        }
    }
}


struct tetrioFindUserPage_Previews: PreviewProvider {
    static var previews: some View {
        
            tetrioFindUserPage()
        
    }
}
