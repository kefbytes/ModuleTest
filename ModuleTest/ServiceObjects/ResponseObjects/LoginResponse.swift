//
//  LoginResponse.swift
//  ModuleTest
//
//  Created by Kent Franks on 4/11/19.
//  Copyright © 2019 KefBytes. All rights reserved.
//

import Foundation
import NetStak

struct LoginResponse: NetStakResponseProtocol {
    
    var urlResponse: URLResponse?
    var loginModel: LoginModel?
    
    init(data: Data?, urlResponse: URLResponse?) throws {
        if let jsonData = data {
            self.urlResponse = urlResponse
            loginModel = try JSONDecoder().decode(LoginModel.self, from: jsonData)
        }
        else {
            self.urlResponse = URLResponse()
        }
    }
}
