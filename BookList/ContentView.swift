//
//  ContentView.swift
//  BookList
//
//  Created by Minsang on 2021/05/04.
//

import SwiftUI

struct ContentView: View {
    
    
    let bookMakers = BookMaker.all()

    var body: some View {
        NavigationView {
            List(self.bookMakers, id: \.name) { bookMaker in
    
                NavigationLink(destination: BookMarkerDetail(bookMaker: bookMaker)) {
                    BookMakerCell(bookMaker: bookMaker)
                }
                
              
            }.navigationBarTitle("도서 리스트", displayMode: .inline)
        }
}

struct BookMakerCell: View {

    let bookMaker: BookMaker

    var body: some View {
        HStack {
            Image(bookMaker.imageUrl)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)

            VStack(alignment: .leading) {
                Text(bookMaker.name).font(.largeTitle)
                Text("\(bookMaker.place)")
            }
        }
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

}
