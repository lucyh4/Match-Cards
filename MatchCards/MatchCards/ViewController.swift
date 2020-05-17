//
//  ViewController.swift
//  MatchCards
//
//  Created by Deepankar D on 12/05/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet private weak var flipLabel: UILabel! {
        didSet{
            updateFlipLabel()
        }
    }
    @IBOutlet private var arrOfCards: [UIButton]!
    
    //MARK: - Created object of MatchCards Class
    private lazy var game = MatchCards(numOfPairOfCards: numOfPairOfCards)
    
    private var numOfPairOfCards: Int {
        return (arrOfCards.count)/2
    }
    
    //MARK: - Creating var for no. of flips with didset property
    var numOfFlips = 0 {
        didSet{
            updateFlipLabel()
        }
    }
    
    private func updateFlipLabel(){
        
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0.944884479, green: 0.5015266538, blue: 0.247677058, alpha: 1)
            
        ]
        let attributedString = NSAttributedString(string:  "Flips: \(numOfFlips)", attributes: attributes)
        flipLabel.attributedText = attributedString
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
    private func updateViewFromModel(){
        for index in arrOfCards.indices{
            let button = arrOfCards[index]
            let card = game.cards[index]
        //    print(index)
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 0) : #colorLiteral(red: 0.944884479, green: 0.5015266538, blue: 0.247677058, alpha: 1)
            }
        }
    }
    
    //MARK: - String of emojis
    //  var arrayOfEmojis = ["😇", "😈", "👻", "🎃", "😴", "🖐🏻", "👁", "✍🏿", "🔴", "🔵"]
    
    var stringOfEmojis = "😇😈👻🎃😴🖐🏻👁✍🏿🔴🔵"
    
    //MARK: - Dictionary for Created cards Emoji
    var emoji = [Card : String]()
    
    //MARK: - Function to get the emoji
    
    private func emoji(for card : Card)-> String{
        if emoji[card] == nil, stringOfEmojis.count > 0{
            let randomStringIdex = stringOfEmojis.index(stringOfEmojis.startIndex, offsetBy: stringOfEmojis.count.arc4random)
            emoji[card] = String(stringOfEmojis.remove(at: randomStringIdex))
        }
        return emoji[card] ?? "?"
    }
    
    
}


//MARK: - Simplifying the statement of generating random index for emojis

extension Int{
    var arc4random : Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        }else{
            return 0
        }
    }
}

