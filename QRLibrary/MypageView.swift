//
//  MypageView.swift
//  QRLibrary
//
//  Created by unme97 on 2021/05/02.
//

import SwiftUI

struct mypageItem : Identifiable {
    var id = UUID()
    var text : String
    var image : String
}

struct MypageView : View {
        
    @State private var mypagelist : [mypageItem] = [ mypageItem(text: "대출", image: "book"), mypageItem(text: "연체", image: "calendar.badge.exclamationmark"), mypageItem(text: "알림", image: "bell"), ]

    var body: some View {
        List {
            Section(header: ListHeader()) {
                HStack {
                    NavigationLink(destination: MyBookList(),
                        label: {
                            Image(systemName: "book")
                            Text("대출")
                        }
                    )
                }
                HStack {
                    NavigationLink(destination: Text("연체"),
                        label: {
                            Image(systemName: "calendar.badge.exclamationmark")
                            Text("연체")
                        }
                    )
                }
                HStack {
                    NavigationLink(destination: Text("알림"),
                        label: {
                            Image(systemName: "bell")
                            Text("알림")
                        }
                    )
                }
            }
        }
        
    }
}

struct MyBookList : View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(ThisUser.booklist![0].state)
        }
    }
}

struct ListHeader: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 56, height: 56, alignment: .center)
                VStack (alignment: .leading) {
                    Spacer()
                    Text("\(ThisUser.user!.name)")
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading)
                    
                    Text("\(ThisUser.user!.email)")
                        .padding(.top, 1)
                        .padding(.leading)
                    Spacer()
                    HStack() {
                        Spacer()
                    }.padding(.leading)
                }
            }
        }
        .padding(0)
        .frame(height: 100)
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
