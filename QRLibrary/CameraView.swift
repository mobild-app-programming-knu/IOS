//
//  CameraView.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/15.
//

import SwiftUI

struct CameraView: View {
    var user : User? = nil
    
    @EnvironmentObject var borrows : Borrows
    
    @State private var isShowingScanner = false
    
    @Binding var isTaken : Bool
    @Binding var takenString : String
    

       var body: some View {
        HStack{
           Button(action: {
               self.isShowingScanner = true
            self.isTaken = false
           }) {
                VStack(){
                    Image(systemName: "qrcode.viewfinder").font(.system(size: 100)).padding(.bottom)
                    Text("대출하기").font(.system(size: 20, weight: .semibold))
                }
           }
           .sheet(isPresented: $isShowingScanner, onDismiss: {
            
           }, content: {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Some simulated data", completion: self.handleScan)
           })
        }.alert(isPresented: self.$isTaken){
            return Alert(title: Text("결과"), message: Text(takenString), dismissButton: .default(Text("OK")))
        }
       }

       private func handleScan(result: Result<String, CodeScannerView.ScanError>) {
          self.isShowingScanner = false
          switch result {
          case .success(let data):
            if let userData = user {
                doBorrow(data: BorrowRequest(borrowerId: userData.id, borrowerName: userData.name, bookId: Int(data)!),
                successCallback: { borrowResponse in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.takenString = "대여가 완료되었습니다."
                        self.isTaken = true
                        
                        print(takenString)
                    }

                    borrows.reloadData(userId: user!.id)
                }, failedCallback: { errorResponse in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.takenString = errorResponse.errors.map({ (customError : ErrorResponse.CustomFieldError) in
                            return customError.reason
                        }).description
                        self.isTaken = true
                        
                        print(takenString)
                    }
                })
            }
          case .failure(let error):
              print("Scanning failed \(error)")
          }
       }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
