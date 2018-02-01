// Copyright SIX DAY LLC. All rights reserved.

import Foundation

struct ConfigExplorer {

    let server: RPCServer

    init(
        server: RPCServer
    ) {
        self.server = server
    }

    func transactionURL(for ID: String) -> URL {
        let endpoint = explorer(for: server)
        let urlString: String = {
            switch server {
            case .main:
                return endpoint + "/tx/" + ID
            }
        }()
        return URL(string: urlString)!
    }

    private func explorer(for server: RPCServer) -> String {
        switch server {
        case .main:
            return "https://explorer.akroma.io"
        }
    }
}
