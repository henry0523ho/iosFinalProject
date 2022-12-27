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
    let league:userLeague
}

struct userLeague: Codable{
    let gamesplayed:Int
    let gameswon:Int
    let rating:Double
    let glicko:Double
    let bestrank:String
    let apm:Double
    let pps:Double
}
