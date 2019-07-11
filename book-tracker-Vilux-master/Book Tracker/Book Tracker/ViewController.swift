//
//  ViewController.swift
//  Book Tracker
//
//  Created by Matti Schneider on 2019-03-03.
//  Copyright © 2019 Matti Schneider. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    let books = [
        Book (title: "Dune", isbn: 9783641173081, author: "Frank Herbert", imageURL: "https://i.pinimg.com/originals/39/0c/8d/390c8d4adbf133ccea67ca70cbd16c41.jpg", rating: 4.5, notes: "Crazy space story"),
        Book(title: "Adventures of the Mad Monk Ji Gong", isbn: 0804843228, author: "Guo Xioting", imageURL: "https://images-na.ssl-images-amazon.com/images/I/51EohUP2WwL._SX318_BO1,204,203,200_.jpg", rating: 3.5, notes: nil),
        Book(title: "Harry Potter", isbn:9781781102459, author: "J.K. Rowling", imageURL: "https://pictures.abebooks.com/isbn/9780747532743-us.jpg", rating: 3, notes: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // required method to conform to UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We are setting the number of
        return books.count
    }
    
    // required method to conform to UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // We are getting the cell from the queue of cells
        // We recycle cells for better performance
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        let book = books[indexPath.row]
        // We set the cell's text label to be our recipe string for that index
        
        cell.textLabel?.text = book.title
        
        if let url = URL(string: book.imageURL), let data = try? Data(contentsOf: url) { //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            cell.imageView?.image = UIImage(data: data)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookViewDetailViewController = segue.destination as? BookViewDetailViewController,
            let index = tableView.indexPathForSelectedRow?.row {
            bookViewDetailViewController.book = books[index]
        }
    }
}

