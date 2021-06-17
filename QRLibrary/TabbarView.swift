//
//  TabbarView.swift
//  QRLibrary
//
//  Created by unme97 on 2021/04/28.
//

import SwiftUI
import Kingfisher

struct TabbarView: View {
    var user : User?
    @State private var selection = 2
    @State var isTaken = false
    @State var takenString = ""
    
    var body: some View {
        TabView(selection: $selection) {
            CameraView(user: user!, isTaken: $isTaken, takenString:$takenString)
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("대출")
                }.tag(1)

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
        }.accentColor(Color(red: 242 / 255, green: 134 / 255, blue: 101 / 256))
        
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
                .autocapitalization(.none)
                .padding(15)
                .padding(.horizontal, 15)
                .background(Color(.systemGray6))
                .cornerRadius(15)
            
            List(self.bookMakers.books.filter({"\($0)".contains(self.text) || self.text.isEmpty}), id: \.self) { book in
                NavigationLink(destination: BookMarkerDetail(book: book)) {
                    BookMakerCell(book: book)
                }.accentColor(Color(red: 242 / 255, green: 134 / 255, blue: 101 / 256))
            }
        }
        
    }
}

struct BookMakerCell: View {
    var book : BookResponse
    
    var body: some View {
        HStack {
            KFImage(URL(string: book.image_url))
                    .resizable()
                    .frame(width: 70, height: 100)
                    .cornerRadius(5)

            VStack(alignment: .leading) {
                Text(book.book_name).font(.system(size: 25, weight: .semibold))
                Text("\(book.library)")
                Text("\(book.status)")
            }
        }
    }
}

class Observer: ObservableObject {
    @Published var books = [BookResponse]()
    
    func forTest(){
        doGetAllBooks(successCallback: { books in
            self.books = books
        }, failedCallback: { errorResponse in
            print(errorResponse)
        })
    }
    
    init(){
        forTest()
    }
}
