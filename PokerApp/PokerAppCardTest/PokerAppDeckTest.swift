//
//  PokerAppDeckTest.swift
//  PokerAppCardTest
//
//  Created by bean Milky on 2021/01/07.
//

import XCTest

class PokerAppDeckTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test카드셔플_확인() throws {
        let deck = Deck()
        let originalDeck = Deck()
        deck.shuffle()
        if originalDeck.cards != deck.cards {
            XCTAssertEqual(originalDeck.cards.sorted {$0.description < $1.description}, deck.cards.sorted {$0.description < $1.description})
        }
        
        XCTAssertEqual(originalDeck.cards.count, deck.count)
    }
    
    func test카드RemoveOne_확인() throws {
        let deck = Deck()
        let originalCount = deck.count
        let card = try deck.removeOne()
        XCTAssertNotNil(card)
        XCTAssertEqual(deck.count, originalCount-1)
    }
    
    func test카드Reset_확인() throws {
        let deck = Deck()
        let originalDeck = deck
        deck.reset()
        XCTAssertEqual(deck, originalDeck)
    }

}
