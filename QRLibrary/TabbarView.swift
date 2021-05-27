//
//  TabbarView.swift
//  QRLibrary
//
//  Created by unme97 on 2021/04/28.
//

import SwiftUI
import Kingfisher

struct TabbarView: View {
    var user : User? = nil
    
    var body: some View {
        TabView(selection: $selection) {
            CameraView(user: user)
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("대출")
                }
            Filter()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }.tag(2)
            MypageView(user: user!)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("마이페이지")
                }.tag(3)
        }
    }
}

struct Filter : View {
    @State var text : String = ""
    @State var bookMakers : [BookResponse] = []
    
    var body :some View{
        VStack{
            BookList(text: self.$text)
        }
    }
}

struct BookList: View {
    @Binding var text :String
    @State var editText : Bool = false
    @ObservedObject var bookMakers = Observer()
    
    var body: some View {
        VStack {
            TextField("검색어를 입력하세요" , text : self.$text)
                .padding(15)
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(15)
            List(self.bookMakers.filter({"\($0)".contains(self.text) || self.text.isEmpty}), id: \.name) { bookMaker in
                NavigationLink(destination: BookMarkerDetail(bookMaker: bookMaker)) {
                    BookMakerCell(bookMaker: bookMaker)
                }
            }
        }
        
    }
}

struct BookMakerCell: View {
    @State var book : BookResponse
    
    var body: some View {
        HStack {
            KFImage(URL(string: book.image_url))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)

            VStack(alignment: .leading) {
                Text(book.book_name).font(.title)
                Text("\(book.library)")
            }
        }
    }
}

class Observer: ObservableObject {
    @Published var bookMakers = [BookResponse]()
    
    func forTest(){
        doGetAllBooks(successCallback: { books in
            self.bookMakers = books
        }, failedCallback: { errorResponse in
            print(errorResponse)
        })
    }
    
    init(){
        forTest()
    }
}
