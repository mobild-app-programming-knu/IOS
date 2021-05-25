//
//  BookMarkerDetail.swift
//  BookList
//
//  Created by Minsang on 2021/05/04.
//

import SwiftUI

struct BookMarkerDetail: View {

    let bookMaker: BookMaker
    var body: some View {

        VStack(alignment: .leading){
            Image(bookMaker.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            HStack() {
                Text("도서명")
                    .padding(.leading, 120)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(bookMaker.name)")
            }
            HStack() {
                Text("위치   ")
                    .padding(.leading, 120)
                    .foregroundColor(Color(UIColor.gray))
                Text("\(bookMaker.place)")
            }
            HStack() {
                Text("상태   ")
                    .padding(.leading, 120)
                    .foregroundColor(Color(UIColor.gray))
                //Text("\(bookMaker.state)")
            }
            
        }

    }

}


struct CarMarkerDetail_Previews: PreviewProvider {
    
    static let previewMaker = BookMaker(name: "hello world", imageUrl: "book1", place: "1층 열람실")
    static var previews: some View {
        BookMarkerDetail(bookMaker: previewMaker)
    }
}
