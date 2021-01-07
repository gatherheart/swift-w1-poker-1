
//
//  main.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/06.
//
import Foundation

let numOfUser = 3

do {
    let poker: Poker = try Poker(type: Poker.GameType.five, numOfUser: numOfUser)
    print(poker.dealer.cards)
    for i in 0..<numOfUser {
        print(poker.users[i].cards)
    }
    
} catch {
    print(error)
}




