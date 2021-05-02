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


struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
