//
//  Card.swift
//  MatchCards
//
//  Created by Deepankar D on 13/05/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import Foundation


struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    static var cardNumber = 0
    
    
    //MARK: - Static method to generate unique identifiers for cards
    static func getUniqueIdentifier() -> Int{
        cardNumber += 1
        return cardNumber
        
    }
    
    //MARK: - Initializer
    init(){
        self.identifier = Card.getUniqueIdentifier()   //Everytime this initialized called a  new card is initialized with unique identifier
    }
}
