//
//  Book.swift
//  Book Tracker
//
//  Created by Matti Schneider on 2019-03-03.
//  Copyright © 2019 Matti Schneider. All rights reserved.
//
class Book {
    var title: String
    var isbn: Int
    var author: String
    var imageURL: String
    var rating: Float
    var notes: String?
    
    init(title: String, isbn: Int, author: String, imageURL: String, rating: Float, notes: String?) {
        self.title = title
        self.isbn = isbn
        self.author = author
        self.imageURL = imageURL
        self.rating = rating
        self.notes = notes
    }
}
