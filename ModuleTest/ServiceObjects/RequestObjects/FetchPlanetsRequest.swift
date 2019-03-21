//
//  FetchPlanetsRequest.swift
//  StarWarsAPITest
//
//  Created by Kent Franks on 2/20/19.
//  Copyright © 2019 Kent Franks. All rights reserved.
//

import Foundation
import NetStak

struct FetchPlanetsRequest: NetStakRequestProtocol {
    
    var requestTypeMethod: NetStakHTTPMethod = .get
    var urlPath: String = "/planets/"
    var mockFileName: String = "FetchPlanets"
    var urlArguments: [URLQueryItem]? = nil
    var headerItems: [String : String]? = nil
    var requestBody: Data? =  nil
    var responseType: NetStakResponseProtocol.Type = FetchPlanetsResponse.self

}
