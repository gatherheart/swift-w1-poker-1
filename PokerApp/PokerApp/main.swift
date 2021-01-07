
//
//  main.swift
//  PokerApp
//
//  Created by bean Milky on 2021/01/06.
//
import Foundation

let card: Card = try! Card(rank: 0, suit: Card.Suit.Joker)
print(card)


var d = Deck()
print(d.cards)
print(d.count)

print()

d.shuffle()
print(d.cards)
print(d.count)

print(try! d.removeOne())
print(d.cards)
print(d.count)

d.reset()
print(d.cards)
print(d.count)

