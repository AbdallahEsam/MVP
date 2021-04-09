//
//  UserData.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation

// MARK: - LoginModel
struct LoginModel: BaseCodable {
    var status: String
    var data: UserData?
    var message: String?
    var isActive: Bool?
    var identifier: String?

    enum CodingKeys: String, CodingKey {
        case data, status, message
        case isActive = "is_active"
        case identifier
    }
}

// MARK: - UserData
struct UserData: Codable {
    var id: Int?
    var fullname, phone, email, gender: String?
    var profileImage: String?
    var token: Token?
    var followers, followings: Int?
    var isFollow: Bool?
    var city, nationality, lat, lng: JSONNull?
    var phoneCode:String?
    enum CodingKeys: String, CodingKey {
        case id, fullname, phone, email, gender
        case profileImage = "profile_image"
        case token, followers, followings
        case isFollow = "is_follow"
        case city, nationality, lat, lng
        case phoneCode = "phonecode"
    }
}

// MARK: - Token
struct Token: Codable {
    var tokenType, accessToken: String?

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
    }
}



class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
