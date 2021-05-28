//
//  MyObserableObject.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/28.
//

import Foundation


class UserObserver : ObservableObject {
    @Published var user : User? = nil
    @Published var loginresult = false
    
    func signIn(email: String, password: String){
        
        doLogin(data: LoginRequest(email: email, password: password),
            successCallback: { userResonse in
                self.loginresult = true
                self.user = userResonse
                print(userResonse)
                
            }, failedCallback: { errorResponse in
                self.loginresult = false
                print(errorResponse)
        })
    }
}

class Borrows : ObservableObject {
    @Published var borrows: [BorrowResponse] = []

    func reloadData(userId : Int){
        doGetAllBorrows(userId: userId, successCallback: { borrows in
            print(borrows)
            self.borrows = borrows
        }, failedCallback: { errorResponse in
            print(errorResponse)
        })
    }
}
