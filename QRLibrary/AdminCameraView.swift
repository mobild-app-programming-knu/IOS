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
    
    

       var body: some View {
           Button(action: {
               self.isShowingScanner = true
           }) {
               Text("반납하기")
           }
           .sheet(isPresented: $isShowingScanner) {
               CodeScannerView(codeTypes: [.qr], simulatedData: "Some simulated data", completion: self.handleScan)
           }
       }

       private func handleScan(result: Result<String, CodeScannerView.ScanError>) {
          self.isShowingScanner = false
          switch result {
          case .success(let data):
            if let userData = user {
                doBorrow(data: BorrowRequest(borrowerId: userData.id, borrowerName: userData.name, bookId: Int(data)!)){ borrowResponse in
                    print(borrowResponse)
                    borrows.reloadData(userId: user!.id)
                } failedCallback: { errorResponse in
                    print(errorResponse)
                }
            }

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
