//
//  ViewController.swift
//  Cookit
//
//  Created by Matti Schneider on 2019-02-25.
//  Copyright © 2019 Matti Schneider. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let recipes = [
        Recipe(title: "Brownies", steps: ["step 1","step 2"], imageURL: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"),
        Recipe (title: "Banana Bread", steps: ["step 1","step 2", "step 3"], imageURL: "https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg"),
        Recipe(title: "Cookies", steps: ["step 1","step 2"], imageURL: "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.title
        // get image from url
        // note we are retrieving the image synchronously for simplicity, this is not a best practice
        
        if let url = URL(string: recipe.imageURL), let data = try? Data(contentsOf: url) { //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            cell.imageView?.image = UIImage(data: data)
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeDetailViewController = segue.destination as? RecipeDetailViewController,
            let index = tableView.indexPathForSelectedRow?.row{
            recipeDetailViewController.recipe = recipes[index]
            
        }
    }
}

