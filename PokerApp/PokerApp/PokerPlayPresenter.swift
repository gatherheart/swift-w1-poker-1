//
//  PokerPlayPresenter.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/08.
//

import Foundation

class PokerPlayPresenter {
    
    let gamePlayer: [Playable]
    let winner: Playable
    
    init(gamePlayer: [Playable], winner: Playable) {
        self.gamePlayer = gamePlayer
        self.winner = winner
    }
    
    func printResult() {
        for i in 0..<gamePlayer.count {
            print("\(gamePlayer[i].playerName) \(gamePlayer[i].cards) \(gamePlayer[i] == winner ? "= Winner" : "")")
        }
    }
    
}
