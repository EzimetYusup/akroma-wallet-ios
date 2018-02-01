// Copyright SIX DAY LLC. All rights reserved.

import Foundation

enum RPCServer: String {
    case main

    var chainID: Int {
        switch self {
        case .main: return 200625
        }
    }

    var name: String {
        switch self {
        case .main: return "Akroma"
        }
    }

    var isTestNetwork: Bool {
        switch self {
        case .main: return false
        }
    }

    var symbol: String {
        switch self {
        case .main: return "AKA"
        }
    }

    var decimals: Int {
        return 18
    }

    init(name: String) {
        self = {
            switch name {
            case RPCServer.main.name: return .main
            default: return .main
            }
        }()
    }

    init(chainID: Int) {
        self = {
            switch chainID {
            case RPCServer.main.chainID: return .main
            default: return .main
            }
        }()
    }
}
