//
//  BookViewDetailViewController.swift
//  Book Tracker
//
//  Created by Matti Schneider on 2019-03-03.
//  Copyright © 2019 Matti Schneider. All rights reserved.
//

import UIKit

class BookViewDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var book: Book?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = book?.title
        
        if let loadedBook = book,
            let url = URL(string: loadedBook.imageURL),
            let data = try? Data(contentsOf: url)
        {
            self.imageView.image = UIImage(data: data)
            self.titleLabel.text = book?.title
            self.isbnLabel.text = String(book!.isbn)
            self.authorLabel.text = book?.author
            self.ratingLabel.text = String(book!.rating)
            self.notesLabel.text = book?.notes
        }
        
        
    }

}
