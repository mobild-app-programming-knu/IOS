//
//  BookMaker.swift
//  BookList
//
//  Created by Minsang on 2021/05/04.
//

var booklist: BookResponse? = nil;

struct BookMaker {
    let name: String
    let imageUrl: String
    let place: String
}

extension BookMaker {
    static func all() -> [BookMaker] {
        return [
            BookMaker(name: "1번째 책", imageUrl: "book1", place: "1층 열람실"),
            BookMaker(name: "2번째 책", imageUrl: "book2", place: "2층 열람실"),
            BookMaker(name: "3번째 책", imageUrl: "book3", place: "1층 열람실"),
            BookMaker(name: "4번째 책", imageUrl: "book4", place: "1층 열람실"),
            BookMaker(name: "5번째 책", imageUrl: "book5", place: "3층 열람실"),
            BookMaker(name: "6번째 책", imageUrl: "book6", place: "1층 열람실"),
            BookMaker(name: "7번째 책", imageUrl: "book1", place: "10층 열람실"),
            BookMaker(name: "8번째 책", imageUrl: "book2", place: "7층 열람실")
        ]
    }
}
