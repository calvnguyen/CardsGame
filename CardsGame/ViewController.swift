//
//  ViewController.swift
//  CardsGame
//
//  Created by Calvin Nguyen on 1/11/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Card6: UIImageView!
    @IBOutlet weak var Card5: UIImageView!
    @IBOutlet weak var Card4: UIImageView!
    @IBOutlet weak var Card3: UIImageView!
    @IBOutlet weak var Card2: UIImageView!
    @IBOutlet weak var Card1: UIImageView!
    var newDeck: Deck!
    var newPlayer: Player!
    var card_set: [Card] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        newDeck = Deck()
        newPlayer = Player(name: "Calvin")
        
        Card1.isHidden = true
        Card2.isHidden = true
        Card3.isHidden = true
        Card4.isHidden = true
        Card5.isHidden = true
        Card6.isHidden = true
        
    }

    @IBAction func drawButtonClicked(_ sender: UIButton) {
        if let thiscard = newPlayer.draw(deck: newDeck){
            newPlayer.hand.append(thiscard)
        }
        let image = newPlayer.hand[0].image
        print(image)
        
        Card1.image = UIImage(named: image)
        Card1.isHidden = false
        
    }
    
    @IBAction func discardButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

