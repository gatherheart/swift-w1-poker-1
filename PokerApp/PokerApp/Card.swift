//
//  Card.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/06.
//
import Foundation


struct Card : CustomStringConvertible, Equatable, Comparable {
    public static func == (lhs: Card, rhs: Card) -> Bool{
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
    public static func < (lhs: Card, rhs: Card) -> Bool {
        return (lhs.rank < rhs.rank) || (lhs.rank == rhs.rank && lhs.suit < rhs.suit)
    }
    
    public enum Suit : String, CaseIterable, Equatable, Comparable {
        public static func < (lhs: Suit, rhs: Suit) -> Bool {
            return lhs.getScore() < rhs.getScore()
        }

        public static func == (lhs: Suit, rhs: Suit) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
        public func getScore() -> Float {
            switch self {
            case .Hearts:
                return 0.1
            case .Clubs:
                return 0.2
            case .Diamonds:
                return 0.3
            case .Spades:
                return 0.4
            default:
                return 0
            }
        }
        
        case Hearts = "♥️", Spades = "♠️", Diamonds = "💎", Clubs = "♣️", Joker = "🃏"
    }
    
    public enum Rank: Int, CaseIterable, Comparable {
        case One = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, J, Q, K
        
        public static func < (lhs: Rank, rhs: Rank) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }

        public static func == (lhs: Rank, rhs: Rank) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
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
