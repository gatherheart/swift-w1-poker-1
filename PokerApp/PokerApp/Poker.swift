//
//  Player.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/07.
//

import Foundation


class Poker {
    
    enum HandScore: Float {
        case NoPair = 0, OnePair = 100, TwoPair = 200, Triple = 300, Straight = 400, FourCard = 500
    }
    static let JOKER_PENALTY: Float = 0.01
    private class func scoreCardsWithJoker(cards: [Card]) -> Float {
        var cardsCase: [[Card]] = [[Card]]()
        var scoreCase: [Float] = [Float]()
        let possibles: [Card.Rank] = [.One, .J, .Q, .K]
        if let index = cards.firstIndex(where: {$0.suit == Card.Suit.Joker}) {
            var copied = cards
            
            for p in possibles {
                copied[index].rank = p
                cardsCase.append(copied)
            }
        }
        for hand in cardsCase {
            scoreCase.append(Poker.calculateScore(cards: hand))
        }
        return scoreCase.max() ?? 0
    }
    
    class func isOnePair(cards: [Card]) -> [Card]? {
        let cardRanks = cards.map { return $0.rank }
        var counts: [Card.Rank: Int] = [:]
        cardRanks.forEach { counts[$0, default: 0] += 1 }
        
        if let key = counts.first(where: { $0.value == 2 })?.key {
            return cards.filter { $0.rank == key }
        }
        return nil
    }
    
    class func isTwoPair(cards: [Card]) -> [Card]? {
        let cardRanks = cards.map { return $0.rank }
        var counts: [Card.Rank: Int] = [:]
        cardRanks.forEach { counts[$0, default: 0] += 1 }
        var copiedCounts = counts
        
        if let key = copiedCounts.first(where: { $0.value == 2 })?.key {
            copiedCounts.removeValue(forKey: key)
            
            if let key2 = copiedCounts.first(where: { $0.value == 2 })?.key {
                return cards.filter { $0.rank == key || $0.rank == key2 }
            }
            
        }
        return nil
    }
    
    class func isTriple(cards: [Card]) -> [Card]? {
        let cardRanks = cards.map { return $0.rank }
        var counts: [Card.Rank: Int] = [:]
        cardRanks.forEach { counts[$0, default: 0] += 1 }
        if let key = counts.first(where: { $0.value == 3 })?.key {
            return cards.filter { $0.rank == key }
        }
        return nil
    }
    
    class func isFourCards(cards: [Card]) -> [Card]? {
        let cardRanks = cards.map { return $0.rank }
        var counts: [Card.Rank: Int] = [:]
        cardRanks.forEach { counts[$0, default: 0] += 1 }
        if let key = counts.first(where: { $0.value == 4 })?.key {
            return cards.filter { $0.rank == key }
        }
        return nil
    }
    
    class func isStraight(cards: [Card]) -> [Card]? {
        var count = 0
        let cardSortedByRank = cards.sorted(by: >)
        var straightCards: [Card] = [Card]()
        let length = cards.count

        for (card1, card2) in zip(cardSortedByRank[0..<length-1], cardSortedByRank[1..<length]) {
                    
            if card1.rank.rawValue == card2.rank.rawValue + 1 {
                count += 1
                straightCards.append(card1)
                if count >= 4 {
                    straightCards.append(card2)
                    return straightCards
                }
            }
        }
        return nil
    }
    
    public class func calculateScore(of: Dealer) -> Float {
        return of.hasJoker ? Poker.scoreCardsWithJoker(cards: of.cards) : Poker.calculateScore(cards: of.cards)
    }
    
    public class func calculateScore(of: Player) -> Float {
        return of.hasJoker ? Poker.scoreCardsWithJoker(cards: of.cards) : Poker.calculateScore(cards: of.cards)
    }
        
    public class func calculateScore(cards: [Card]) -> Float {
        var score: Float = 0

        func calculate(hand: [Card], type: HandScore) -> Float {
            var _score: Float = 0
            let penalty: Float = hand.contains { $0.suit == Card.Suit.Joker } ? JOKER_PENALTY : 0
            _score = type.rawValue - penalty
            if let maxCard: Card = hand.max() {
                _score += Float(maxCard.rank.rawValue)
                _score += maxCard.suit.getScore()
            }
            return _score
        }
        
        if let hand = isFourCards(cards: cards) {
            score += calculate(hand: hand, type: .FourCard)
        }
        else if let hand = isStraight(cards: cards) {
            score += calculate(hand: hand, type: .Straight)
        }
        else if let hand = isTriple(cards: cards) {
            score += calculate(hand: hand, type: .Triple)
        }
        else if let hand = isTwoPair(cards: cards) {
            score += calculate(hand: hand, type: .TwoPair)
        }
        else if let hand = isOnePair(cards: cards) {
            score += calculate(hand: hand, type: .OnePair)
        }
        else {
            score += calculate(hand: cards, type: .NoPair)
        }
        return score
    }
    
    
}
