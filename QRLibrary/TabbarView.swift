//
//  TabbarView.swift
//  QRLibrary
//
//  Created by unme97 on 2021/04/28.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            CameraView(user: ThisUser.user)
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("대출")
                }
            Filter()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }.tag(2)
            MypageView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("마이페이지")
                }.tag(3)
        }
    }
}

struct Filter : View {
    @State var text : String = ""
    
    var body :some View{
        VStack{
            BookList(text: self.$text)
            
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

struct BookList: View {
    @Binding var text :String
    @State var editText : Bool = false
    let bookMakers = BookMaker.all()

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
    
    let bookMaker: BookMaker

    var body: some View {
        HStack {
            Image(bookMaker.imageUrl)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(bookMaker.name).font(.largeTitle)
                Text("\(bookMaker.place)")
            }
        }
    }
}
