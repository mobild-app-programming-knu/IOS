//
//  ResponseType.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/12.
//

import Foundation


struct LoginResponse : Codable{
    var id : Int
    
    var name : String

    var phoneNum : String

    var email : String

    var password : String
}

struct JoinResponse : Codable{
    var id : Int
    
    var name : String

    var phoneNum : String

    var email : String

    var password : String
}

struct BorrowResponse : Codable{
    
}

struct ErrorResponse : Codable{
    var code : String
    var message : String
    var status : Int
    var errors : [CustomFieldError]

    struct CustomFieldError : Codable{
        var field : String
        var value : String
        var reason : String
    }
}
