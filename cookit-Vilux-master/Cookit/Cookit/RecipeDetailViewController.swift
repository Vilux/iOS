//
//  RecipeDetailViewController.swift
//  Cookit
//
//  Created by Matti Schneider on 2019-02-25.
//  Copyright © 2019 Matti Schneider. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var recipe: Recipe?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = recipe?.title
        tableView.delegate = self
        tableView.dataSource = self
        if let loadedRecipe = recipe,
            let url = URL(string: loadedRecipe.imageURL),
            let data = try? Data(contentsOf: url)
        {
            self.imageView.image = UIImage(data: data)
        }
    }
    
    // required method to conform to UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We are setting the number of
        return (recipe?.steps.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath)
        cell.textLabel?.text = recipe?.steps[indexPath.row]
        return cell
    }
}
