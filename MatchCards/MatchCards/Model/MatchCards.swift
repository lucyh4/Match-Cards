//
//  MatchCards.swift
//  MatchCards
//
//  Created by Deepankar D on 13/05/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import Foundation

class MatchCards{
    var cards = [Card]()
    var  indexOfOneAndOnlyFaceUpCard : Int?
    func chooseCard(at index : Int) {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
  //MARK: - init method to initialize the cards array with uniqueIdentifier
    init(numOfPairOfCards : Int){
        for _ in 0..<numOfPairOfCards{
            let card = Card()  //Create variable of type Card
            cards += [card, card]   //Append two card in the cards array
        }
       // TODO : - Shuffling of Cards
    }
}
