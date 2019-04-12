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
    let session = NetStakSession.shared

    // MARK: - Fetch functions
    func fetchStarWarsFilms(completion: @escaping () -> Void) {
        NetStakServerConnection.execute(with: request, and: session) {
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
