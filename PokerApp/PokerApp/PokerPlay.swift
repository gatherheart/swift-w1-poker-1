//
//  PokerPlay.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/08.
//

import Foundation

class PokerPlay: Poker {
    enum GameType: Int {
        case five=5, seven=7
    }
    enum ValidationError: Error {
        case wrongNumOfUser
    }
    
    let type: PokerPlay.GameType
    private(set) public var users: [Player]
    let dealer: Dealer
    let initialNumOfCards: Int
    let numOfUser: Int
    var gamePlayer: [Playable] {
        return users + [dealer]
    }

    init(type: PokerPlay.GameType = .five, numOfUser: Int) throws {
        
        guard 1...4 ~= numOfUser else {
            throw ValidationError.wrongNumOfUser
        }
        
        self.type = type
        self.dealer = Dealer(deck: Deck())
        self.users = [Player]()
        self.initialNumOfCards = self.dealer.deck.count
        self.numOfUser = numOfUser
        super.init()

        self.dealer.getCards(cards: try self.handOut())
        for i in 0..<numOfUser {
            let user = Player(index: i+1)
            user.getCards(cards: try self.handOut())
            self.users.append(user)
        }
    }
    
    func handOut() throws -> [Card] {
        var cards: [Card] = [Card]()
        self.dealer.deck.shuffle()
        for _ in 0..<self.type.rawValue{
            cards.append(try self.dealer.deck.removeOne())
        }
        return cards
    }
    
    func whoIsWinner() -> Playable? {
        for i in 0..<self.numOfUser {
            self.users[i].setScore(score: Poker.calculateScore(of: self.users[i]))
        }
        self.dealer.setScore(score: Poker.calculateScore(of: self.dealer))
        if let winner: Playable = gamePlayer.max(by: {$0.score > $1.score}) {
            return winner
        }
        return nil
    }
    
}
