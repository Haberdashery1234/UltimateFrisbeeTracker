//
//  UFAMyTeamsViewController.swift
//  UltimateFrisbeeTracker
//
//  Created by Christian.Grise on 11/9/16.
//  Copyright © 2016 Christian.Grise. All rights reserved.
//

import UIKit

class MyTeamsViewController: UIViewController {

    @IBOutlet var teamsTableView: UITableView!
    
    var teamsMap : [ String : Team ] {
        return TeamsManager.sharedInstance.teamsMap
    }
    
    var teams : [ Team ] {
        return TeamsManager.sharedInstance.teams
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("My Teams", comment: "My Teams")
        
        // Do any additional setup after loading the vie
        teamsTableView.toggleExtraSeparators(hidden: true)
        teamsTableView.configureAutomaticDimensions(withDefaultRowHeight: 72.0)
    }
    
    /// MARK: - IBActions
    @IBAction func addButtonTapped() {
        performSegue(withIdentifier: "segueTeamDetails", sender: nil)
    }
}

extension MyTeamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count > 0 ? teams.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if teams.count > 0 {
            let cellIdentifier = "TeamTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TeamsTableViewCell
            
            let team = teams[indexPath.row]
            
            cell.logoImageView.image = team.logo ?? UIImage(named: "launch-image")
            cell.nameLabel.text = team.name
            return cell
        } else {
            let cellIdentifier = "NoTeamsTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            return cell
        }
    }
}

extension MyTeamsViewController: UITableViewDelegate {
    
}
