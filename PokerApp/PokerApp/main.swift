
//
//  main.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/06.
//
import Foundation

let numOfUser = 4

do {
    let poker: PokerPlay = try PokerPlay(type: PokerPlay.GameType.five, numOfUser: numOfUser)
    var scores: [Float] = [Float]()
    for i in 0..<numOfUser {
        scores.append(Poker.calculateScore(of: poker.users[i]))
    }
    scores.append(Poker.calculateScore(of: poker.dealer))
    let winnerScore: Float = scores.max() ?? -1
    
    for i in 0..<numOfUser {
        print("User#\(i+1)", terminator: " ")
        print(poker.users[i].cards, scores[i] == winnerScore ? "= Winner" : "")
    }
    print("Dealer", terminator: " ")
    print(poker.dealer.cards, scores[numOfUser] == winnerScore ? "= Winner" : "")
    
} catch {
    print(error)
}
