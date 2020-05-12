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
    
    //MARK: - Array of emojis
    let arrayOfEmojis = ["😇", "😈", "👻", "🎃"]
    
    
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
            flipCard(wihtEmoji: arrayOfEmojis[cardNumber], on: sender)
        }
        
    }
    
    //MARK: - Function to flip the card
    func flipCard(wihtEmoji emoji : String, on button : UIButton){
        if emoji == button.currentTitle{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.1425348818, green: 0.5279285312, blue: 0.9669786096, alpha: 1)
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
    }
    
}

