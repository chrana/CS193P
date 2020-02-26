//
//  Card.swift
//  Concentration
//
//  Created by Chinku on 2020-02-24.
//  Copyright © 2020 Interdev. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var idetifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        idetifierFactory += 1
        return idetifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
    }
}
