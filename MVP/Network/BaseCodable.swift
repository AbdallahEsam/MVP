//
//  BaseCodable.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation

protocol BaseCodable: Codable {
    var isSuccess: Bool { get }
    var status: String { get }
    var message: String? { get }
}

extension BaseCodable {
    var isSuccess: Bool {
        return status == Constants.responseValid
    }
}

struct BaseModelData<T: Codable>: BaseCodable {
    var status: String
    var message: String?
    var data: T?
}

struct BaseModel: BaseCodable {
    var status: String
    var message: String?
}


