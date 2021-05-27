//
//  BookMarkerDetail.swift
//  BookList
//
//  Created by Minsang on 2021/05/04.
//

import SwiftUI
import Kingfisher

struct BookMarkerDetail: View {

    let bookMaker: BookMaker
    var body: some View {

        VStack(alignment: .leading){
            
            KFImage(URL(string: bookMaker.image_url))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 50)
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
            }
            Spacer()
        }
    }

}


struct BookMarkerDetail_Previews: PreviewProvider {
    static let previewMaker = BookResponse(book_id: 1, book_name: "주술회전0", author: "아쿠타미 게게", library: "중앙도서관 3열람실", publisher: "서울미디어코믹스", publication_date: "2019/04/25", image_url: "http://bimage.interpark.com/goods_image/7/4/9/2/305307492g.jpg")
    static var previews: some View {
        BookMarkerDetail(bookMaker: previewMaker)
    }
}
