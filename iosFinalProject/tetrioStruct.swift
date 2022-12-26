//
//  tetrioStruct.swift
//  iosFinalProject
//
//  Created by User10 on 26/12/22.
//

import Foundation

struct UserStruct: Codable{
    let data:UserData
}
struct UserData: Codable{
    let user:UserDataUser
}

struct UserDataUser: Codable{
    let username:String
    let xp:Int
//    let rank:String
//    let apm:Double
//    let pps:Double
}
