//
//  chessStruct.swift
//  iosFinalProject
//
//  Created by User10 on 27/12/22.
//

import Foundation


struct ChessStruct: Codable{
    var daily:[ChessItem]
}

struct ChessItem:Identifiable,Codable{
    let id=UUID()
    var username:String
    var win_count:Int
    var loss_count:Int
    var draw_count:Int
}
