//
//  AddTeamViewController.swift
//  UltimateFrisbeeTracker
//
//  Created by Christian.Grise on 11/10/16.
//  Copyright © 2016 Christian.Grise. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var playerDisplaySelector: UISegmentedControl!
    @IBOutlet weak var playersTableView: UITableView!
    
    var teamID : String?
    var team : Team!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        playersTableView.toggleExtraSeparators(hidden: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if teamID == nil {
            teamID = UUID().uuidString
        }
        
        team = TeamsManager.sharedInstance.teamsMap[teamID!] ?? Team(withId: teamID!)
    }
    
    // MARK: - IBActions
    @IBAction func saveTapped() {
        team.name = teamTextField.text
            
        TeamsManager.sharedInstance.teamsMap[teamID!] = team
        TeamsManager.sharedInstance.saveTeams()
    }
    
    @IBAction func addPlayerTapped() {
        performSegue(withIdentifier: "seguePlayerDetails", sender: nil)
    }
}

extension TeamDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.roster.count > 0 ? team.roster.count : 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if team.roster.count > 0 {
            let cellIdentifier = "PlayerTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TeamsTableViewCell
            
            let player = team.roster[indexPath.row]
            
            cell.nameLabel.text = player.name
            return cell
        } else {
            let cellIdentifier = "NoPlayersTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            return cell
        }
    }
}

extension TeamDetailsViewController: UITableViewDelegate {
    
}
