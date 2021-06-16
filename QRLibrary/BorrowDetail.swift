//
//  BorrowDetail.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/30.
//

import SwiftUI
import Kingfisher

struct BorrowDetail: View {

    let borrow: BorrowResponse
    
    var body: some View {

        VStack(alignment: .leading){
            
            KFImage(URL(string: borrow.book.image_url))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 50)
            HStack() {
                Text("도서명  ")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(borrow.book.book_name)")
            }
            HStack(){
                Text("상   태  ")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text(borrow.state)
            }
            HStack() {
                Text("대출자  ")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(borrow.user_name)")
            }
            Spacer()
        }
    }
}
