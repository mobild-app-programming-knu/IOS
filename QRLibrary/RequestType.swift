//
//  RequestType.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/11.
//

import Foundation

struct LoginRequest : Codable{
    var email : String
    var password : String
}

struct JoinRequest : Codable{
    var name : String
    var phoneNum : String
    var email : String
    var password : String
}

struct BorrowRequest : Codable{
    var borrowerId : Int
    var borrowerName : String
    var bookIds : [Int]
}

