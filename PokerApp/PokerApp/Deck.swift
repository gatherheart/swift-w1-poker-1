//
//  Deck.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/07.
//

import Foundation

struct Deck : Equatable {
    
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        return lhs.cards == rhs.cards
    }
    
    enum ValidationError: Error {
        case OutOfCardCapacity
    }
    
    public var cards: [Card]
    var count: Int {
        get {
            return self.cards.count
        }
    }
    
    public init () {
        self.cards = [Card]()
        self.refillCards()
    }
    
    private mutating func refillCards() {
        for rank in 1...13 {
            for suit in Card.Suit.allCases {
                if suit != Card.Suit.Joker {
                    self.cards.append(try! Card(rank: rank, suit: suit))
                }
            }
        }
        self.cards.append(try! Card(rank: 1, suit: Card.Suit.Joker))
    }
    
    public mutating func shuffle() {
        for i in 0..<count-1 {
            let j = Int.random(in: i..<count)
            (self.cards[i], self.cards[j]) = (self.cards[j], self.cards[i])
        }
    }
    
    public mutating func removeOne() throws -> Card {
        guard count > 0 else {
            throw Deck.ValidationError.OutOfCardCapacity
        }
        return self.cards.remove(at: 0)
    }
    
    public mutating func reset() {
        self.cards = [Card]()
        self.refillCards()
    }
}

