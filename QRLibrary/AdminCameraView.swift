//
//  AdminCameraView.swift
//  QRLibrary
//
//  Created by unme97 on 2021/05/29.
//

import SwiftUI

struct AdminCameraView: View {
    var user : User? = nil
    
    @EnvironmentObject var borrows : Borrows
    
    @State private var isShowingScanner = false
    
    @State private var isTaken = false
    @State private var takenString = ""
    
       var body: some View {
           Button(action: {
               self.isShowingScanner = true
           }) {
            VStack(){
                Image(systemName: "qrcode.viewfinder").font(.system(size: 100)).padding(.bottom)
                Text("반납하기").font(.system(size: 20, weight: .semibold))
            }
           }
           .sheet(isPresented: $isShowingScanner) {
               CodeScannerView(codeTypes: [.qr], simulatedData: "Some simulated data", completion: self.handleScan)
           }.alert(isPresented: $isTaken){
                return Alert(title: Text("결과"), message: Text(takenString), dismissButton: .default(Text("OK")))
           }
       }

       private func handleScan(result: Result<String, CodeScannerView.ScanError>) {
          self.isShowingScanner = false
          switch result {
          case .success(let data):
            doReturn(book_id: Int(data)!, successCallback: { returnResult in
                isTaken = true
                takenString = returnResult.result
                
                borrows.reloadDataForManager()
            }, failedCallback:{ errorResponse in
                isTaken = true
                takenString = errorResponse.errors.map({ (customError : ErrorResponse.CustomFieldError) in
                    return customError.reason
                }).description
            })
        
              print("Success with \(data)")
          case .failure(let error):
              print("Scanning failed \(error)")
          }
       }
}

struct AdminCameraView_Previews: PreviewProvider {
    static var previews: some View {
        AdminCameraView()
    }
}
