//
//  MypageView.swift
//  QRLibrary
//
//  Created by unme97 on 2021/05/02.
//

import SwiftUI
import Foundation
import Combine


struct mypageItem : Identifiable {
    var id = UUID()
    var text : String
    var image : String
}

struct MypageView : View {
    var user : User?

    var body: some View {
        List {
            Section(header: ListHeader(user: user)) {
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
    @EnvironmentObject var borrows: Borrows
    
    var body: some View {
        VStack(alignment: .leading) {
            List(borrows.borrows, id: \.self){ borrow in
                Text(borrow.book.book_name)
            }
        }
    }
}

struct ListHeader: View {
    var user : User? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 56, height: 56, alignment: .center)
                VStack (alignment: .leading) {
                    Spacer()
                    Text("\(user!.name)")
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading)
                    
                    Text("\(user!.email)")
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
