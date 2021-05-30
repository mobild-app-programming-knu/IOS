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
    @Published var expireds : [BorrowResponse] = []
    
    @Published var allBorrowings : [BorrowResponse] = []
    @Published var allExpired : [BorrowResponse] = []

    func reloadData(userId : Int){        
        doGetBorrowings(userId: userId, successCallback: { borrows in
            print("현재 대여중인 목록들...")
            print(borrows)
            print()
            self.borrows = borrows
        }, failedCallback: { errorResponse in
            print(errorResponse)
        })
        doGetExpired(userId: userId, successCallback: { borrows in
            print("현재 연체된 목록들...")
            print(borrows)
            print()
            self.expireds = borrows
        }, failedCallback: { errorResponse in
            print(errorResponse)
        })
    }
    
    func reloadDataForManager(){
        doGetAllBorrowings(successCallback: { borrows in
            print("현재 대여중인 목록들...")
            print(borrows)
            print()
            self.allBorrowings = borrows
        }, failedCallback: { errorResponse in
            print(errorResponse)
        })
        doGetAllExpired(successCallback: { borrows in
            print("현재 연체된 목록들...")
            print(borrows)
            print()
            self.allExpired = borrows
        }, failedCallback: { errorResponse in
            print(errorResponse)
        })
    }
}
