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
                Text("반납하기").font(.system(size: 20, weight: .semibold))
            }
           }
           .sheet(isPresented: $isShowingScanner) {
               CodeScannerView(codeTypes: [.qr], simulatedData: "Some simulated data", completion: self.handleScan)
           }
        }.alert(isPresented: self.$isTaken){
            return Alert(title: Text("결과"), message: Text(takenString), dismissButton: .default(Text("OK")))
        }
       }

       private func handleScan(result: Result<String, CodeScannerView.ScanError>) {
          self.isShowingScanner = false
        
          switch result {
          case .success(let data):
            doReturn(book_id: Int(data)!, successCallback: { returnResult in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.takenString = "반납이 완료되었습니다."
                    self.isTaken = true
                    
                    print(takenString)
                }
                
                borrows.reloadDataForManager()
            }, failedCallback:{ errorResponse in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.takenString = errorResponse.errors.map({ (customError : ErrorResponse.CustomFieldError) in
                        return customError.reason
                    }).description
                    self.isTaken = true
                    
                    print(takenString)
                }
            })
          case .failure(let error):
              print("Scanning failed \(error)")
          }
       }
}

//struct AdminCameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdminCameraView()
//    }
//}
