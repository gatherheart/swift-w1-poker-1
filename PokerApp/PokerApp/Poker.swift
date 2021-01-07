//
//  Player.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/07.
//

import Foundation

class Gamer {
    
    enum UserType {
        case dealer, participant
    }
    
    let type: Gamer.UserType
    var cards: [Card] 
    
    init(type: Gamer.UserType = .participant) {
        self.type = type
        self.cards = [Card]()
    }
    
}

class Poker {
    
    enum GameType: Int {
        case five=5, seven=7
    }
    enum ValidationError: Error {
        case wrongNumOfUser
    }
    let type: Poker.GameType
    var deck: Deck
    var users: [Gamer]
    let dealer: Gamer
    let initialNumOfCards: Int
    
    init(type: Poker.GameType = .five, numOfUser: Int) throws {
        
        guard 1...4 ~= numOfUser else {
            throw ValidationError.wrongNumOfUser
        }
        
        self.type = type
        self.deck = Deck()
        self.initialNumOfCards = self.deck.count
        self.dealer = Gamer(type: Gamer.UserType.dealer)
        self.users = [Gamer]()
        
        self.dealer.cards = try self.handOut()
        for _ in 0..<numOfUser {
            let user = Gamer()
            user.cards = try self.handOut()
            self.users.append(user)
        }
    }
    
    func handOut() throws -> [Card] {
        var cards: [Card] = [Card]()
        for _ in 0..<self.type.rawValue{
            cards.append(try self.deck.removeOne())
        }
        return cards
    }
    
}
