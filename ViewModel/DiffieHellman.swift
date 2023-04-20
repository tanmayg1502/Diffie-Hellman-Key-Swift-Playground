//  Created by Tanmay Goel on 15.04.23.

import Foundation

func generateSharedSecret(p: Int, secret: Int, otherPublicKey: Int) -> Int {
    return Int(pow(Double(otherPublicKey), Double(secret)).truncatingRemainder(dividingBy: Double(p)))
}

func generateKeys(p: Int, g: Int, secret: Int) -> Int {
    return Int(pow(Double(g), Double(secret)).truncatingRemainder(dividingBy: Double(p)))
}

