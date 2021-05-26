//
//  CameraView.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/15.
//

import SwiftUI

struct CameraView: View {
    var user : User? = nil
    
    @State private var isShowingScanner = false

       var body: some View {
           Button(action: {
               self.isShowingScanner = true
           }) {
               Text("대출하기")
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

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
