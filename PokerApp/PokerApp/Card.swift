//
//  Card.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/06.
//
import Foundation


class Card : CustomStringConvertible, Equatable {
    public static func == (lhs: Card, rhs: Card) -> Bool{
        return lhs.description == rhs.description
    }

    public enum Suit : String, CaseIterable {
        case Hearts = "♥️", Spades = "♠️", Diamonds = "💎", Clubs = "♣️", Joker = "🃏"
    }
    
    public enum Rank: Int, CaseIterable {
        case One = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, J, Q, K
        
        public func convertRank() -> String {
            switch self.rawValue {
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return String(self.rawValue)
            }
        }
    }

    enum ValidationError: Error {
        case wrongRankRange
        case wrongCard
    }
    
    var rank: Rank
    var suit: Suit
    
    public init(rank: Rank, suit: Suit) throws {
        guard 1...13 ~= rank.rawValue else {
            throw ValidationError.wrongRankRange
        }
        self.suit = suit
        self.rank = rank
    }
    
    public init(rank: Int, suit: Suit) throws {
        guard 1...13 ~= rank else {
            throw ValidationError.wrongRankRange
        }
        self.suit = suit
        self.rank = Card.Rank(rawValue: rank)!
    }
    
    public init(suit: Suit) throws {
        guard suit == Card.Suit.Joker else {
            throw ValidationError.wrongCard
        }
        self.suit = suit
        self.rank = Card.Rank.K
    }

    var description: String {
        return "\(self.suit.rawValue)\(self.rank.convertRank())"
    }
}
