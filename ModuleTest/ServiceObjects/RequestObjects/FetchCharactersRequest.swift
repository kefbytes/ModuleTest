//
//  FetchCharactersRequest.swift
//  StarWarsAPITest
//
//  Created by Kent Franks on 2/12/19.
//  Copyright © 2019 Kent Franks. All rights reserved.
//

import Foundation
import NetStak

struct FetchCharactersRequest: RequestProtocol {
    
    var requestTypeMethod: HTTPMethod = .get
    var urlPath: String = "/people/"
    var mockFileName: String = "FetchCharacters"
    var urlArguments: [URLQueryItem]? = nil
    var headerItems: [String : String]? = nil
    var requestBody: Data? =  nil
    var responseType: ResponseProtocol.Type = FetchCharactersResponse.self

}
