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

    var body :some View {
        List {
            Section(header: ListHeader()) {
                ForEach(mypagelist) {item in
                    HStack {
                        NavigationLink(
                            destination: Text(item.text),
                            label: {
                                Image(systemName: item.image)
                                Text(item.text)
                            }
                        )
                    }
                }
            }
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
                    Text("이름")
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading)
                    
                    Text("아이디")
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
