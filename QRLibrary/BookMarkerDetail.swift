//
//  BookMarkerDetail.swift
//  BookList
//
//  Created by Minsang on 2021/05/04.
//

import SwiftUI
import Kingfisher

struct BookMarkerDetail: View {

    let book: BookResponse
    
    var body: some View {

        VStack(alignment: .leading){
            
            KFImage(URL(string: book.image_url))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 50)
            HStack() {
                Text("도서명")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(book.book_name)")
            }
            HStack() {
                Text("위치   ")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(book.library)")
            }
            HStack() {
                Text("상태   ")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(book.status)")
            }
            Spacer()
        }
    }
}
