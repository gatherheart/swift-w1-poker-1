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

    enum ValidationError: Error {
        case wrongRankRange
    }
    
    var rank: Int
    var suit: Suit
    
    public init(rank: Int, suit: Suit) throws {
        guard 0...13 ~= rank else {
            throw ValidationError.wrongRankRange
        }
        self.suit = suit
        self.rank = suit == Card.Suit.Joker ? 0 : rank
    }
    
    private func convertRank() -> String {
        switch self.rank {
        case 0:
            return ""
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(self.rank)
        }
    }
    
    var description: String {
        return "\(self.suit.rawValue)\(self.convertRank())"
    }
}
