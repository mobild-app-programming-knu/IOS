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
            Section(header: ListHeader(user: user)
                        .background(Color(red: 242 / 255, green: 154 / 255, blue: 128 / 256))
                        .listRowInsets(EdgeInsets(
                                            top: 0,
                                            leading: 0,
                                            bottom: 0,
                                            trailing: 0))
            ) {
                HStack {
                    NavigationLink(destination: MyBookList(),
                        label: {
                            Image(systemName: "book")
                            Text("대출")
                        }
                    ).accentColor(Color(red: 242 / 255, green: 134 / 255, blue: 101 / 256))
                }
                HStack {
                    NavigationLink(destination: MyExpiredList(),
                        label: {
                            Image(systemName: "calendar.badge.exclamationmark")
                            Text("연체")
                        }
                    ).accentColor(Color(red: 242 / 255, green: 134 / 255, blue: 101 / 256))
                }
            }
        }
        
    }
}
struct CenteringColumnPreferenceKey: PreferenceKey {
    typealias Value = [CenteringColumnPreference]

    static var defaultValue: [CenteringColumnPreference] = []

    static func reduce(value: inout [CenteringColumnPreference], nextValue: () -> [CenteringColumnPreference]) {
        value.append(contentsOf: nextValue())
    }
}

struct CenteringColumnPreference: Equatable {
    let width: CGFloat
}

struct CenteringView: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .preference(
                    key: CenteringColumnPreferenceKey.self,
                    value: [CenteringColumnPreference(width: geometry.frame(in: CoordinateSpace.global).width)]
                )
        }
    }
}

struct MyExpiredList : View {
    @EnvironmentObject var borrows: Borrows
    @State private var width: CGFloat? = nil
    
    var body: some View {
        HStack {
            Text("도서명")
                .padding(.leading, 70)
            Spacer()
            Text("반납일")
                .padding(.trailing, 70)
        }
        .frame(height: 40)
        .background(Color(red: 242 / 255, green: 134 / 255, blue: 101 / 256).opacity(0.5))
        .cornerRadius(10)

        List(borrows.expireds, id: \.self){ borrow in
            HStack {
                Text(borrow.book.book_name)
                    .frame(width: width, alignment: .leading)
                    .lineLimit(1)
                    .background(CenteringView())
                Spacer()
                Text(borrow.expiredAt)
            }
        }.onPreferenceChange(CenteringColumnPreferenceKey.self) { preferences in
            for p in preferences {
                let oldWidth = self.width ?? CGFloat.zero
                if p.width > oldWidth {
                    self.width = p.width
                }
            }
        }
    }
}

struct MyBookList : View {
    @EnvironmentObject var borrows: Borrows
    @State private var width: CGFloat? = nil
    
    var body: some View {
        HStack {
            Text("도서명")
                .padding(.leading, 70)
            Spacer()
            Text("반납일")
                .padding(.trailing, 70)
            
        }
        .frame(height: 40)
        .background(Color(red: 242 / 255, green: 134 / 255, blue: 101 / 256).opacity(0.5))
        .cornerRadius(10)

        List(borrows.borrows, id: \.self){ borrow in
            HStack {
                Text(borrow.book.book_name)
                    .frame(width: width, alignment: .leading)
                    .lineLimit(1)
                    .background(CenteringView())
                Spacer()
                Text(borrow.expiredAt)
            }
        }.onPreferenceChange(CenteringColumnPreferenceKey.self) { preferences in
            for p in preferences {
                let oldWidth = self.width ?? CGFloat.zero
                if p.width > oldWidth {
                    self.width = p.width
                }
            }
        }
    }
}

struct ListHeader: View {
    var user : User? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Spacer(minLength: 20)
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 56, height: 56, alignment: .center)
                VStack (alignment: .leading) {
                    Spacer()
                    Text("\(user!.name)")
                        .textCase(.lowercase)
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading)
                    
                    Text("\(user!.email)")
                        .textCase(.lowercase)
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
        .cornerRadius(10)
    }
}
struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
