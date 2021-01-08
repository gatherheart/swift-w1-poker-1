//
//  PokerAppPokerRuleTest.swift
//  PokerAppCardTest
//
//  Created by bean Milky on 2021/01/08.
//

import XCTest

class PokerAppPokerRuleTest: XCTestCase {

    func test스트레이트_카드_성공체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 3, 2, 4, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }

        XCTAssertNotNil(Poker.isStraight(cards: cards))
        
    }
    
    func test원페어_카드_성공체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 1, 3, 4, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }

        XCTAssertNotNil(Poker.isOnePair(cards: cards))
    }
    
    func test투페어_카드_성공체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 1, 3, 3, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }

        XCTAssertNotNil(Poker.isTwoPair(cards: cards))
    }
    
    func test트리플_카드_성공체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 1, 1, 3, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }
        XCTAssertNotNil(Poker.isTriple(cards: cards))
    }
    
    func test포카드_카드_성공체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 1, 1, 1, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }

        XCTAssertNotNil(Poker.isFourCards(cards: cards))
    }
    
    func test스트레이트_카드_실패체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 2, 3, 4, 6]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }
        XCTAssertNil(Poker.isStraight(cards: cards))
    }
    
    func test원페어_카드_실패체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 2, 3, 8, 9]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }
        XCTAssertNil(Poker.isOnePair(cards: cards))
    }
    
    func test투페어_카드_실패체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 1, 3, 4, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }
        XCTAssertNil(Poker.isTwoPair(cards: cards))
    }
    
    func test트리플_카드_실패체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 1, 3, 3, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }
        XCTAssertNil(Poker.isTriple(cards: cards))
    }
    
    func test포카드_카드_실패체크() throws {
        var cards: [Card] = [Card]()
        let ranks = [1, 1, 1, 2, 5]
        for rank in ranks {
            cards.append(try! Card(rank: rank, suit: Card.Suit.Clubs))
        }
        XCTAssertNil(Poker.isFourCards(cards: cards))
    }
    
    
}
