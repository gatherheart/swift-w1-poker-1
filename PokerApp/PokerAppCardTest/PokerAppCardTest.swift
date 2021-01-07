//
//  PokerAppCardTest.swift
//  PokerAppCardTest
//
//  Created by bean Milky on 2021/01/06.
//
import XCTest

class PokerAppCardTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test카드숫자범위_확인() throws {
        let randomInt = Int.random(in: 1...13)
        let card = try Card(rank: randomInt, suit: Card.Suit.Clubs)
        XCTAssertNotNil(card)
    }
    
    func test카드숫자_음수_에러() throws {
        let randomInt = -Int.random(in: 1...100)

        XCTAssertThrowsError(try Card(rank: randomInt, suit: Card.Suit.Clubs), "")
        {
            error in XCTAssertEqual(error as? Card.ValidationError, Card.ValidationError.wrongRankRange)
        }
    }
    
    func test카드숫자_범위초과_에러() throws {
        let randomInt = Int.random(in: 14...100)
        
        XCTAssertThrowsError(try Card(rank: randomInt, suit: Card.Suit.Clubs), "")
        {
            error in XCTAssertEqual(error as? Card.ValidationError, Card.ValidationError.wrongRankRange)
        }
    }

}
