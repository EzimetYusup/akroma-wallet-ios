// Copyright SIX DAY LLC. All rights reserved.

import Foundation
import TrustKeystore

enum ImportType {
    case keystore(string: String, password: String, nickName:String)
    case privateKey(privateKey: String, nickName:String)
    case mnemonic(words: [String], password: String, nickName:String)
    case watch(address: Address, nickName:String)
}
