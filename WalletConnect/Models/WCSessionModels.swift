// Copyright © 2017-2019 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import Foundation

public struct WCExchangeKeyParam: Codable {
    let peerId: String
    let peerMeta: WCPeerMeta
    let nextKey: String
}

public struct WCSessionRequestParam: Codable {
    let peerId: String
    let peerMeta: WCPeerMeta
    let chainId: String?
}

public struct WCSessionUpdateParam: Codable {
    public let approved: Bool
    public let chainId: Int?
    public let accounts: [String]?

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(approved, forKey: .approved)
        try container.encode(chainId, forKey: .chainId)
        try container.encode(accounts, forKey: .accounts)
    }
}

public struct WCApproveSessionResponse: Codable {
    public let approved: Bool
    public let chainId: Int
    public let accounts: [String]

    public let peerId: String?
    public let peerMeta: WCPeerMeta?
}
