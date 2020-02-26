//
//  Concentration.swift
//  Concentration
//
//  Created by Chirag on 2020-02-24.
//  Copyright © 2020 Interdev. All rights reserved.
//

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberofPairsofCards: Int) {
        assert(numberofPairsofCards > 0,"Concentration.init(at: \(numberofPairsofCards)): you must have atleast one pair of card")
        for _ in 0..<numberofPairsofCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}
