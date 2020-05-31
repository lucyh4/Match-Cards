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
    var score = 0
    private var  indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    func chooseCard(at index : Int) {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 1
                    
                }
                cards[index].isFaceUp = true
                
            //    indexOfOneAndOnlyFaceUpCard = nil
            }else{
//                for flipDownIndex in cards.indices{
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
               // print(index)
             //   cards[matchIndex].done = false
              //  cards[index].done = false
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
        
        cards.shuffle()
    }
}
