//
//  LoginVM.swift
//  ModuleTest
//
//  Created by Kent Franks on 4/11/19.
//  Copyright © 2019 KefBytes. All rights reserved.
//

import Foundation
import NetStak

struct LoginVM {
    
    var loginRequest = LoginRequest()
    let session = NetStakSession.shared

    mutating func loginAndGetSubsctiptionKey(username: String?, password: String?, completion: @escaping () -> Void) {
        var parameterDictionary: [String : Any] = [String : Any]()
        parameterDictionary["EmailAddress"] = username
        parameterDictionary["Password"] = password
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        loginRequest.requestBody = httpBody
        NetStakServerConnection.execute(with: loginRequest, and: .post, session: session) {
            (response, error) in
            if let _ = error {
                // present alert
                return
            }
            guard let loginResponse = response as? LoginResponse else {
                // present alert
                return
            }
            guard let key = loginResponse.loginModel?.subscriptionKey else {
                return
            }
            let defaults = UserDefaults.standard
            defaults.setValue(key, forKey: "userDefaultsEcdSubscriptionKey")
            completion()
        }
    }

}
