//
//  PokerAppGameTest.swift
//  PokerAppCardTest
//
//  Created by bean Milky on 2021/01/07.
//

import XCTest

class PokerAppGameTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test포커게임생성() throws {
        
        let numOfUsers: [Int] = Array(1...4)
        let gameTypes: [PokerPlay.GameType] = [.five, .seven]
        for gameType in gameTypes {
            for numOfUser in numOfUsers {
                let poker: PokerPlay = try PokerPlay(type: gameType, numOfUser: numOfUser)
                let originalNumOfCards = poker.initialNumOfCards

                XCTAssertEqual(poker.dealer.cards.count, gameType.rawValue)
                for i in 0..<numOfUser {
                    XCTAssertEqual(poker.users[i].cards.count, gameType.rawValue)
                }
                XCTAssertEqual(poker.dealer.deck.count, originalNumOfCards-(numOfUser+1)*gameType.rawValue)
                
                for i in 0..<numOfUser-1 {
                    for j in i+1..<numOfUser {
                        XCTAssertNotEqual(poker.users[i].cards.sorted { $0.description < $1.description }, poker.users[j].cards.sorted { $0.description < $1.description })
                    }
                }
                
                for i in 0..<numOfUser {
                    XCTAssertNotEqual(poker.users[i].cards.sorted { $0.description < $1.description }, poker.dealer.cards.sorted { $0.description < $1.description })
                }
                
            }
        }
    }

}
