//
//  Player.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/08.
//

import Foundation

class Playable {
    private(set) var playerName: String
    private(set) var pid: String
    private(set) var cards: [Card]
    private(set) var _hasJoker: Bool = false
    private(set) var score: Float
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
    
    init(name: String) {
        self.cards = [Card]()
        self.playerName = name
        self.pid = Playable.idGenerator()
        self.score = 0
    }
    
    func getCards(cards: [Card]) {
        self.cards = cards
    }
    private class func idGenerator() -> String {
        return "\(randomString(length: 3))-\(randomString(length: 3))-\(randomString(length: 3))"
    }
    private class func randomString(length: Int) -> String {
          let letters = "abcdefghijklmnopqrstuvwxyz0123456789"
          return String((0..<length).map{ _ in letters.randomElement()! })
    }
    public func setScore(score: Float) {
        let maxScore = Poker.HandScore.FourCard.rawValue+Float(Card.Rank.K.rawValue)+Card.Suit.Spades.getScore()
        guard 0...maxScore ~= score else {
            return
        }
        self.score = score
    }
}

class Player: Playable {
    
    init(index: Int) {
        super.init(name: "User#\(index)")
    }
    
}

class Dealer: Playable {
   
    var deck: Deck
    init(deck: Deck) {
        self.deck = deck
        super.init(name: "Dealer")
    }
}
