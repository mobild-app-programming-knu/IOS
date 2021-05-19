//
//  RestClient.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/10.
//

import Foundation

import Alamofire

let baseURL = "http://ec2-52-79-203-88.ap-northeast-2.compute.amazonaws.com:3000/api"
let localURL = "http://localhost:9090/api"

func doLogin(data:LoginRequest, successCallback: @escaping (User) -> Void, failedCallback: @escaping (ErrorResponse) -> Void){
    doRestTask(requestURL: baseURL + "/user/login", method: .post, data: data, successCallback: successCallback, failedCallback: failedCallback)
}


func doJoin(data:JoinRequest, successCallback: @escaping (JoinResponse) -> Void, failedCallback: @escaping (ErrorResponse) -> Void){
    doRestTask(requestURL: baseURL + "/user/join", method: .post, data: data, successCallback: successCallback, failedCallback: failedCallback)
}

func doBorrow(data:BorrowRequest, successCallback: @escaping (BorrowResponse)->Void, failedCallback: @escaping (ErrorResponse) -> Void){
    doRestTask(requestURL: baseURL + "/borrow/create", method: .post, data: data, successCallback: successCallback, failedCallback: failedCallback)
}



private func doRestTask<T : Codable, F : Codable>(requestURL:String, method:HTTPMethod, data:T?, successCallback: @escaping (F) -> Void, failedCallback: @escaping (ErrorResponse) -> Void) {
    
    func makeURLRequest<T : Codable>(requestURL:String, method:HTTPMethod, data:T?) -> URLRequest?{
        var request = URLRequest(url: URL(string: requestURL)!)
        request.method = method
        
        if let jsonBody = try? JSONEncoder().encode(data){
            request.httpBody = jsonBody
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
    
    if let request = makeURLRequest(requestURL: requestURL, method: method, data: data){
        AF.request(request).responseJSON(){ response in
            switch response.result{
            case .success :
                if let rowData = response.data{
                    if response.response?.statusCode == 200{
                        if let data = try? JSONDecoder().decode(F.self, from: rowData) {
                            successCallback(data)
                        }
                    }else{
                        if let data = try? JSONDecoder().decode(ErrorResponse.self, from: rowData){
                            failedCallback(data)
                        }
                    }
                }
            case .failure(let error) : print(error)
            }
        }
    }
}
