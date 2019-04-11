//
//  LoginModel.swift
//  ModuleTest
//
//  Created by Kent Franks on 4/11/19.
//  Copyright © 2019 KefBytes. All rights reserved.
//

import Foundation

struct LoginModel: Decodable {
    let subscriptionKey: String?
    let company: Company?
    
    enum CodingKeys: String, CodingKey {
        case subscriptionKey = "SubscriptionKey"
        case company = "Company"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        subscriptionKey = try container.decodeIfPresent(String.self, forKey: .subscriptionKey)
        company = try container.decodeIfPresent(Company.self, forKey: .company)
    }
}

struct Company: Decodable {
    let id: Int?
    let name: String?
    let usesMultiWarehousing: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case usesMultiWarehousing = "UsesMultiWarehousing"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        usesMultiWarehousing = try container.decodeIfPresent(Bool.self, forKey: .usesMultiWarehousing)
    }
}

