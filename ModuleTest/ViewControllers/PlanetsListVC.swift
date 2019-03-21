//
//  PlanetsListVC.swift
//  StarWarsAPITest
//
//  Created by Kent Franks on 2/20/19.
//  Copyright © 2019 Kent Franks. All rights reserved.
//

import UIKit

class PlanetsListVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var planetsTitleLabel: UILabel!
    @IBOutlet weak var planetsTableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - Properties
    let planetsListVM = PlanetsListVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        planetsTitleLabel.isHidden = true
        fetchPlanets()
    }
    
    // MARK: - Fetch
    func fetchPlanets() {
        spinner.startAnimating()
        planetsListVM.fetchStarWarsPlanets {
            () in
            for planet in self.planetsListVM.starWarsPlanetsArray {
                guard let name = planet.name else {
                    continue
                }
                print(name)
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                    self.planetsTableView.reloadData()
                }
            }
        }
    }

}

// MARK: - UITableView DataSource
extension PlanetsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetsListVM.starWarsPlanetsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        cell.textLabel?.text = planetsListVM.starWarsPlanetsArray[indexPath.row].name
        return cell
    }
}
