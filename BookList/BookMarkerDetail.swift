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

        VStack{
            Image(bookMaker.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            Text("본 책의 이름은 \(bookMaker.name)입니다.")
            Text("해당 도서는 \(bookMaker.place)에 있습니다.")
        }

    }

}


struct CarMarkerDetail_Previews: PreviewProvider {
    
    static let previewMaker = BookMaker(name: "hello world", imageUrl: "book1", place: "1층 열람실")
    static var previews: some View {
        BookMarkerDetail(bookMaker: previewMaker)
    }
}
