//
//  Player.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/08.
//

import Foundation

protocol Playable {
    var cards: [Card] { get }
    var hasJoker: Bool { get }
    func getCards(cards: [Card])
}

class Player: Playable {
    private(set) var cards: [Card]
    private(set) var _hasJoker: Bool = false
    var hasJoker: Bool {
        if _hasJoker {
            return true
        }
        for card in cards {
            if card.suit == Card.Suit.Joker {
                _hasJoker = true
                return true
            }
        }
        return false
    }
    
    init() {
        self.cards = [Card]()
    }
    
    func getCards(cards: [Card]) {
        self.cards = cards
    }
}

class Dealer: Playable {
    private(set) var cards: [Card]
    private(set) public var deck: Deck
    private(set) var _hasJoker: Bool = false
    var hasJoker: Bool {
        if _hasJoker {
            return true
        }
        for card in cards {
            if card.suit == Card.Suit.Joker {
                _hasJoker = true
                return true
            }
        }
        return false
    }

    init() {
        self.deck = Deck()
        self.cards = [Card]()
    }
    func getCards(cards: [Card]) {
        self.cards = cards
    }
}
