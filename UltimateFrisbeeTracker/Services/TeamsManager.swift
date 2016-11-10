//
//  TeamsManager.swift
//  UltimateFrisbeeTracker
//
//  Created by Christian.Grise on 11/9/16.
//  Copyright © 2016 Christian.Grise. All rights reserved.
//

import Foundation

class TeamsManager: NSObject {
    
    static let sharedInstance = TeamsManager()
    
    var teamsMap: [ String : Team ]!
    var teams: [Team]! {
        return teamsMap.values.sorted()
    }
    
    private override init() {
        super.init()
        loadTeams()
    }
    
    func saveTeams() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(teams, toFile: Team.ArchiveURL.path)
        
        if !isSuccessfulSave {
            print("Failed to save teams")
        } else {
            print("Saved successfully to \(Team.ArchiveURL.path)")
        }
    }
    
    func loadTeams() {
        let loadedTeams = NSKeyedUnarchiver.unarchiveObject(withFile: Team.ArchiveURL.path) as? [Team] ?? []
        if loadedTeams == [] {
            print("Failed to load teams")
        } else {
            print("Loaded successfully from \(Team.ArchiveURL.path)")
        }
        teamsMap = [:]
        loadedTeams.forEach { team in
            teamsMap[team.id] = team
        }
        
    }
}
