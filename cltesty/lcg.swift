//
//  lcg.swift
//  cltesty
//
//  Created by John F. Davis on 10/10/23.
//

import Foundation

// LCG
// Linear Congruential Generator
// "a pseudo random number generator"
//
//  X n+1 = (a X n + c) mod m
// X sub n+1 is generated from X sub n
// where X is a sequence of random numbers
//
// m, the modulus:       0 < m
// a, the multiplier:    0 < a < m
// c, the increment:     0 <= c < m
// X0, the seed          0 <= X0 < m
//
// if c = 0  Multiplicative Congruent Generator. aka mixed congruential generator
// if c != 0 Lehmer RNG
//
// Lehmer generator published in 1951
// LCG published in 1958 by W.E. Thomson and A. Rotenberg
//
// m prime, c=0
// original Lehmer RNG
// The period is m-1 if multiplier `a` is chosen to be a positive elment of the integers modulo m.
// The initial state must be chosen between 1 and m-1.
//
//
// When a = 1, c = 1, produces a simple modulo-m counter which has a long period but not random.


func Lcg(xn: Int, a: Int, c: Int, m: Int) -> Int {
    return (a * xn + c) % m
}

func LcgCounter() {
    print("Lcg Counter")
    let x0:Int = 1   // seed
    let a:Int = 1    // multiplier
    let c:Int = 1    // the increment
    let m:Int = 5    // the modulus
    var xn:Int

    xn = x0
    for _ in 1...10 {
        xn = Lcg(xn: xn, a:a, c: c, m: m)
        print("xn: \(xn)")
    }
}

func LehmanPRNG() {
    print("Lehman PRNG")
    let x0:Int = 4   // seed
    let a:Int = 3    // multiplier
    let c:Int = 0    // the increment
    let m:Int = 5    // the modulus
    var xn:Int

    xn = x0
    for _ in 1...10 {
        xn = Lcg(xn: xn, a:a, c: c, m: m)
        print("xn: \(xn)")
    }
}




