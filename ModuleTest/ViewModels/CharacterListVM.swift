//
//  CharacterListVM.swift
//  StarWarsAPITest
//
//  Created by Kent Franks on 2/4/19.
//  Copyright © 2019 Kent Franks. All rights reserved.
//

import Foundation
import NetStak

class CharacterListVM {
    
    // MARK: - Properties
    var starWarsCharacterArray = [StarWarsCharacter]()
    var request = FetchCharactersRequest()
    let session = NetStakSession.shared
    let url: URL?
    
    // MARK: - Initializers
    init() {
        guard let url = NetStakURLHelper.buildURL(with: session, request: request) else {
            // present alert
            self.url = nil
            return
        }
        self.url = url
    }

    // MARK: - Fetch functions
    func fetchStarWarsCharacters(completion: @escaping () -> Void) {
        guard let url = url else {
            // present alert
            return
        }
        NetStakServerConnection.execute(with: url, and: request, session: session) {
            result in
            switch result {
            case .success(let response):
                guard let fetchCharactersResponse = response as? FetchCharactersResponse else {
                    // present alert
                    return
                }
                self.starWarsCharacterArray = fetchCharactersResponse.characters
                self.fetchNextPageOfCharacters() {
                    () in
                    completion()
                }
            case .failure(let error):
                let _ = error.localizedDescription
                // present alert
            }
        }
    }
    
    func fetchNextPageOfCharacters(completion: @escaping () -> Void) {
        let queryItem = URLQueryItem(name: "page", value: "2")
        request.urlArguments = [queryItem]
        guard let url = NetStakURLHelper.buildURL(with: session, request: request) else {
            // present alert
            return
        }
        NetStakServerConnection.execute(with: url, and: request, session: session) {
            result in
            switch result {
            case .success(let response):
                guard let fetchCharactersResponse = response as? FetchCharactersResponse else {
                    // present alert
                    return
                }
                self.starWarsCharacterArray.append(contentsOf: fetchCharactersResponse.characters)
                completion()
            case .failure(let error):
                let _ = error.localizedDescription
                // present alert
            }
        }
    }
    
}
