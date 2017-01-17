//
//  ViewController.swift
//  CardsGame
//
//  Created by Calvin Nguyen on 1/11/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var Card6: UIImageView!
    @IBOutlet weak var Card5: UIImageView!
    @IBOutlet weak var Card4: UIImageView!
    @IBOutlet weak var Card3: UIImageView!
    @IBOutlet weak var Card2: UIImageView!
    @IBOutlet weak var Card1: UIImageView!
    var newDeck: Deck!
    var newPlayer: Player!
    var suit = String()
    var rank = String()
    var card_remove: Int = 1
    var count: Int = 1
    

    
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
        
        let tapGesture1 = UITapGestureRecognizer()
        let tapGesture2 = UITapGestureRecognizer()
        let tapGesture3 = UITapGestureRecognizer()
        let tapGesture4 = UITapGestureRecognizer()
        let tapGesture5 = UITapGestureRecognizer()
        let tapGesture6 = UITapGestureRecognizer()
        
        tapGesture1.addTarget(self, action: #selector(ViewController.imageTapped1))
        
        tapGesture2.addTarget(self, action: #selector(ViewController.imageTapped2))
        
        tapGesture3.addTarget(self, action: #selector(ViewController.imageTapped3))
        tapGesture4.addTarget(self, action: #selector(ViewController.imageTapped4))
        tapGesture5.addTarget(self, action: #selector(ViewController.imageTapped5))
        tapGesture6.addTarget(self, action: #selector(ViewController.imageTapped6))
        
        Card1.addGestureRecognizer(tapGesture1)
        Card2.addGestureRecognizer(tapGesture2)
        Card3.addGestureRecognizer(tapGesture3)
        Card4.addGestureRecognizer(tapGesture4)
        Card5.addGestureRecognizer(tapGesture5)
        Card6.addGestureRecognizer(tapGesture6)
        
        textLabel.isHidden = true
        
        
    }
    
    func imageTapped1(){
        print("image 1 clicked")
        Card1.isHighlighted = true
        suit = newPlayer.hand[0].suit
        rank = newPlayer.hand[0].rank
        card_remove = 1
        
    }
    
    func imageTapped2(){
        print("image 2 clicked")
        Card2.isHighlighted = true
        suit = newPlayer.hand[1].suit
        rank = newPlayer.hand[1].rank
        card_remove = 2
    }
    
    func imageTapped3(){
        print("image 3 clicked")
        Card3.isHighlighted = true
        suit = newPlayer.hand[2].suit
        rank = newPlayer.hand[2].rank
        card_remove = 3
    }
    
    func imageTapped4(){
        print("image 4 clicked")
        Card4.isHighlighted = true
        suit = newPlayer.hand[3].suit
        rank = newPlayer.hand[3].rank
        card_remove = 4
    }
    
    func imageTapped5(){
        print("image 5 clicked")
        Card5.isHighlighted = true
        suit = newPlayer.hand[4].suit
        rank = newPlayer.hand[4].rank
        card_remove = 5
    }

    func imageTapped6(){
        print("image 6 clicked")
        Card6.isHighlighted = true
        suit = newPlayer.hand[5].suit
        rank = newPlayer.hand[5].rank
        card_remove = 6
        
    }
    

    @IBAction func drawButtonClicked(_ sender: UIButton) {
        textLabel.isHidden = true
        print("count is \(count)")
        switch count{
            case 1:
                if let thiscard = newPlayer.draw(deck: newDeck)
                {
                    newPlayer.hand.append(thiscard)
                }
                let image = newPlayer.hand[count].image
                Card1.image = UIImage(named: image)
                Card1.isHidden = false
                count += 1
            case 2:
                if let thiscard = newPlayer.draw(deck: newDeck)
                {
                    newPlayer.hand.append(thiscard)
                }
                let image = newPlayer.hand[count].image
                Card2.image = UIImage(named: image)
                Card2.isHidden = false
                count += 1
            case 3:
                if let thiscard = newPlayer.draw(deck: newDeck)
                {
                    newPlayer.hand.append(thiscard)
                }
                let image = newPlayer.hand[count].image
                Card3.image = UIImage(named: image)
                Card3.isHidden = false
                count += 1
            case 4:
                if let thiscard = newPlayer.draw(deck: newDeck)
                {
                    newPlayer.hand.append(thiscard)
                }
                let image = newPlayer.hand[count].image
                Card4.image = UIImage(named: image)
                Card4.isHidden = false
                count += 1
            case 5:
                if let thiscard = newPlayer.draw(deck: newDeck)
                {
                    newPlayer.hand.append(thiscard)
                }
                let image = newPlayer.hand[count].image
                Card5.image = UIImage(named: image)
                Card5.isHidden = false
                count += 1
            case 6:
                if let thiscard = newPlayer.draw(deck: newDeck)
                {
                    newPlayer.hand.append(thiscard)
                }
                let image = newPlayer.hand[count].image
                Card6.image = UIImage(named: image)
                Card6.isHidden = false
                count += 1
            default:
                print("hand is full!")
                textLabel.text = "Hand is Full!"
                textLabel.isHidden = false
            
        }
        
        
        
    }
    
    @IBAction func discardButtonClicked(_ sender: UIButton) {
        if (newPlayer.discard(suit: suit, rank: rank)){
            if (suit == "s"){
                suit = "Spades"
            }
            else if (suit == "c"){
                suit = "Clubs"
            }
            else if (suit == "h"){
                suit = "Hearts"
            }
            else if (suit == "d"){
                suit = "Diamonds"
            }
            
            if (rank == "j"){
                rank = "Jack"
            }
            else if (rank == "q"){
                rank = "Queen"
            }
            else if (rank == "k"){
                rank = "King"
            }
            print("removed card \(rank) of \(suit) successfully")
            
            if (card_remove == 1){
                Card1.image = nil
                count -= 1
            }
            else if (card_remove == 2){
                Card2.image = nil
                count -= 1
            }
            else if (card_remove == 3){
                Card3.image = nil
                count -= 1
            }
            else if (card_remove == 4){
                Card4.image = nil
                count -= 1
            }
            else if (card_remove == 5){
                Card5.image = nil
                count -= 1
            }
            else if (card_remove == 6){
                Card6.image = nil
                count -= 1
            }
            print("count after \(count)")
            newPlayer.show_cards()
            textLabel.text = "Discarded card \(rank) of \(suit) successfully"
            textLabel.isHidden = false
            
        }
    }
    
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        newDeck.reset()
        newDeck.shuffle()
        newPlayer.hand.removeAll()
        Card1.image = nil
        Card2.image = nil
        Card3.image = nil
        Card4.image = nil
        Card5.image = nil
        Card6.image = nil
        count = 1
        textLabel.text = "Game is Resetted!"
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

