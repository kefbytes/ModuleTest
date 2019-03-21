//
//  FilmsListVM.swift
//  StarWarsAPITest
//
//  Created by Kent Franks on 2/15/19.
//  Copyright © 2019 Kent Franks. All rights reserved.
//

import Foundation
import NetStak

class FilmsListVM {
    
    // MARK: - Properties
    var starWarsFilmsArray = [StarWarsFilm]()
    var request = FetchFilmsRequest()
    let serverConfig = NetStakServerConfig()
    let serverConnection: NetStakServerConnection?
    
    // MARK: - Initializers
    init() {
        serverConnection = NetStakServerConnection(config: serverConfig)
    }

    // MARK: - Fetch functions
    func fetchStarWarsFilms(completion: @escaping () -> Void) {
        serverConnection?.execute(with: request, and: .get) {
            (response, error) in
            if let _ = error {
                // present alert
                return
            }
            guard let fetchFilmsResponse = response as? FetchFilmsResponse else {
                // present alert
                return
            }
            self.starWarsFilmsArray = fetchFilmsResponse.films
            completion()
        }
    }

}
