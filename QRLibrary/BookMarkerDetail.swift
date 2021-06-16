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
                Text("저자")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(book.author)")
            }
            HStack() {
                Text("위치   ")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(book.library)")
            }
<<<<<<< HEAD
            HStack() {
                Text("상태   ")
                    .padding(.leading, 100)
                    .foregroundColor(Color(UIColor.gray))
                
            }
=======
//            HStack() {
//                Text("상태   ")
//                    .padding(.leading, 100)
//                    .foregroundColor(Color(UIColor.gray))
//            }
>>>>>>> a6828f75e2ed5d5517e064fde3e8e2aa603edb9a
            Spacer()
        }
    }
}
