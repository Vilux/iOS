//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Matti Schneider on 2019-02-24.
//  Copyright © 2019 Matti Schneider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var p1Image: UIImageView!

    @IBOutlet weak var p2Image: UIImageView!
    
    let images = ["rock", "paper", "scissors"]
    
    var p1Choice = ""
    var p2Choice = ""
    
    var button1Enabled = true
    var button2Enabled = true
    
    @IBAction func p2ButtonTapped(_ sender: UIButton) {
        if !button1Enabled {
            return
        }
        
        let randomImage = images.randomElement()
        
        if let p2Select = randomImage{
            p2Image.image = UIImage(named: p2Select)
            p2Choice = p2Select
        }
        
        if p2Choice == p1Choice {
            self.winLabel.text = "It's a tie"
        }else if p2Choice == "scissors" && p1Choice == "rock" {
            self.winLabel.text = "P1 wins"
        }else if p2Choice == "scissors" && p1Choice == "paper"{
            self.winLabel.text = "P2 wins"
        }else if p2Choice == "paper" && p1Choice == "rock"{
            self.winLabel.text = "P2 wins"
        }else if p2Choice == "rock" && p1Choice == "scissors"{
            self.winLabel.text = "P2 wins"
        }else if p2Choice == "rock" && p1Choice == "paper" {
            self.winLabel.text = "P1 wins"
        }else if p2Choice == "paper" && p1Choice == "scissors" {
            self.winLabel.text = "P1 wins"
        }
        
        button1Enabled = false
        button2Enabled = true
        
    }
    
    @IBAction func p1ButtonTapped(_ sender: UIButton) {
        if !button2Enabled {
            return
        }
        
        let randomImage = images.randomElement()
        
        if let p1Select = randomImage{
            p1Image.image = UIImage(named: p1Select)
            p1Choice = p1Select
        }
        
        if p1Choice == p2Choice {
            self.winLabel.text = "It's a tie"
        }else if p1Choice == "scissors" && p2Choice == "rock" {
            self.winLabel.text = "P2 wins"
        }else if p1Choice == "scissors" && p2Choice == "paper"{
            self.winLabel.text = "P1 wins"
        }else if p1Choice == "paper" && p2Choice == "rock"{
            self.winLabel.text = "P1 wins"
        }else if p1Choice == "rock" && p2Choice == "scissors"{
            self.winLabel.text = "P1 wins"
        }else if p1Choice == "rock" && p2Choice == "paper" {
            self.winLabel.text = "P2 wins"
        }else if p1Choice == "paper" && p2Choice == "scissors" {
            self.winLabel.text = "P2 wins"
        }
        
        button2Enabled = false
        button1Enabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

