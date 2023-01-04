//
//  enum_struc.swift
//  cltesty
//
//  Created by John F. Davis on 1/3/23.
//

import Foundation

// See function five and the comment below on
// why this is necessary.
extension Rank: CaseIterable {}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
}

// In the case where values of enumeration are actual values,
// not just another way of writing their raw values, you
// don't need to provide a meaninful raw value.


// function five challenges the reader to
// write a routine that teturns an array of all cards
// I found this method via stack overflow
// https://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type/49588446#49588446
extension Suit: CaseIterable {}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades:
            return "black"
        case .clubs:
            return "black"
        case .diamonds:
            return "red"
        case .hearts:
            return "red"
        }
    }

}


func enum_struct_one() {
    print("--------")

    let ace = Rank.ace
    print("ace is \(ace.rawValue)")
        
}

func compare_rank(card_one:  Rank, card_two: Rank) -> Bool {
    return (card_one.rawValue == card_two.rawValue)
}

func enum_struct_two() {
    print("--------")

    let card_one = Rank.ace
    let card_two = Rank.king
    print("cards are same \(compare_rank(card_one: card_one, card_two: card_two))")
}


// an enum can have stored properties for each case
// This is an encoding of a server status for
// uptime and downtime.  If an error occurs,
// then return the failure message
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case uptime(String)
}

func enum_struct_three() {
    print("--------")

    let success = ServerResponse.result("6am", "8pm")
    let failure = ServerResponse.failure("an error occured")
    let status = ServerResponse.uptime("six hours")

    // Notice, sunrise, sunset and message are like parameters
    // which get filled in via the property.
    switch status {
//    switch failure {
//    switch status {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure... \(message)")
    case let .uptime(message):
        print("Server uptime is \(message)")
    }
    
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}


func enum_struct_four() {
    print("--------")

    let threeOfSpades = Card(rank: .three, suit: .spades)
    let threeOfSpadesDescription = threeOfSpades.simpleDescription()
    
    print("your card is \(threeOfSpadesDescription)")
}


// https://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type/49588446#49588446
// see above for more info
func enum_struct_five() -> [Card] {
    print("--------")
    
    var result: [Card] = []
    
    Suit.allCases.forEach { Suit in
        Rank.allCases.forEach {
            print("card is  \(Suit)  \($0.simpleDescription())")
            result.append(Card(rank: $0, suit: Suit))
        }
    }
    return result
}
