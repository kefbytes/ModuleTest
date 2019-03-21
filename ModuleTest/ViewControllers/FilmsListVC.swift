//
//  FilmsListVC.swift
//  StarWarsAPITest
//
//  Created by Kent Franks on 2/15/19.
//  Copyright © 2019 Kent Franks. All rights reserved.
//

import UIKit

class FilmsListVC: UIViewController {
    
    // MARK: - outlets
    @IBOutlet weak var filmsTableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var filmsTitleLabel: UILabel!

    // MARK: - Properties
    let filmsListVM = FilmsListVM()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        filmsTitleLabel.isHidden = true
        fetchFilms()
    }
    
    // MARK: - Fetch
    func fetchFilms() {
        spinner.startAnimating()
        filmsListVM.fetchStarWarsFilms {
            () in
            for film in self.filmsListVM.starWarsFilmsArray {
                guard let title = film.title else {
                    continue
                }
                print(title)
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                    self.filmsTableView.reloadData()
                }
            }
        }
    }

}

// MARK: - UITableView DataSource
extension FilmsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsListVM.starWarsFilmsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        cell.textLabel?.text = filmsListVM.starWarsFilmsArray[indexPath.row].title
        return cell
    }
}
