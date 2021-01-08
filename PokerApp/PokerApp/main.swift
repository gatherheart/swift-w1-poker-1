
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
    if let winner = poker.whoIsWinner() {
        let presenter: PokerPlayPresenter = PokerPlayPresenter(gamePlayer: poker.gamePlayer, winner: winner)
        presenter.printResult()
    }
    
} catch {
    print(error)
}
