//
//  LoginRequest.swift
//  ModuleTest
//
//  Created by Kent Franks on 4/11/19.
//  Copyright © 2019 KefBytes. All rights reserved.
//

import Foundation
import NetStak

struct LoginRequest: NetStakRequestProtocol {
    
    var requestTypeMethod: NetStakHTTPMethod = .post
    var urlPath: String = "ecd/REST/Company/Login"
    var mockFileName: String = "Login"
    var urlArguments: [URLQueryItem]? = nil
    var headerItems: [String : String]? = nil
    var requestBody: Data? =  nil
    var responseType: NetStakResponseProtocol.Type = LoginResponse.self
    
    init() {
        headerItems = buildUrlRequestHeaderItems()
    }
    
    private func buildUrlRequestHeaderItems() -> [String:String]? {
        var headerItems: [String:String]? = ["Content-Type":"Application/json", "Ocp-Apim-Subscription-Key":"a27feb91356445af891b0eb36168107c"]
        let defaults = UserDefaults.standard
        if let ecdSubscriptionKey = defaults.object(forKey: "userDefaultsEcdSubscriptionKey") as? String {
            headerItems?["ecd-subscription-key"] = ecdSubscriptionKey
        }
        return headerItems
    }
    
}


