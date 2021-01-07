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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func test카드셔플_확인() throws {
        var deck = Deck()
        let originalDeck = deck
        deck.shuffle()
        // Deck이 struct일 때만 가능한 로직 -> class일 경우 다른 방식으로 해결해야 함
        XCTAssertNotEqual(originalDeck.cards, deck.cards)
        XCTAssertEqual(originalDeck.count, deck.count)
    }
    
    func test카드RemoveOne_확인() throws {
        var deck = Deck()
        let originalCount = deck.count
        let card = try deck.removeOne()
        XCTAssertNotNil(card)
        XCTAssertEqual(deck.count, originalCount-1)
    }
    
    func test카드Reset_확인() throws {
        var deck = Deck()
        let originalDeck = deck
        deck.reset()
        XCTAssertEqual(deck, originalDeck)
    }

}
