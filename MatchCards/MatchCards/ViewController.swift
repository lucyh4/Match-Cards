//
//  ViewController.swift
//  MatchCards
//
//  Created by Deepankar D on 12/05/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet var arrOfCards: [UIButton]!
    
    //MARK: - Created object of MatchCards Class
    lazy var game = MatchCards(numOfPairOfCards: (arrOfCards.count)/2)
    
   
    
    //MARK: - Creating var for no. of flips with didset property
      var numOfFlips = 0 {
          didSet{
              flipLabel.text = "Flips: \(numOfFlips)"
          }
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func cardClicked(_ sender: UIButton) {
        numOfFlips+=1
        if let cardNumber = arrOfCards.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
    //MARK: - Function to update View
    func updateViewFromModel(){
        for index in arrOfCards.indices{
            let button = arrOfCards[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: .normal)
                           button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
            }
        }
    }
    
    //MARK: - Array of emojis
    var arrayOfEmojis = ["😇", "😈", "👻", "🎃", "😴", "🖐🏻", "👁", "✍🏿", "🔴", "🔵"]
       
   //MARK: - Dictionary for Created cards Emoji
    var emoji = [Int : String]()
    
    //MARK: - Function to get the emoji
    
    func emoji(for card : Card)-> String{
        if emoji[card.identifier] == nil{
            let emojiIndex = Int(arc4random_uniform(UInt32(arrayOfEmojis.count)))
            emoji[card.identifier] = arrayOfEmojis.remove(at: emojiIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
 
    
}

