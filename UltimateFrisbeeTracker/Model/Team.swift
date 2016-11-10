//
//  Team.swift
//  UltimateFrisbeeTracker
//
//  Created by Christian.Grise on 11/9/16.
//  Copyright © 2016 Christian.Grise. All rights reserved.
//

import UIKit

enum PlayerDisplay: String {
    case name = "Name"
    case number = "Number"
    case nameThenNumber = "NameNumber"
    case numberThenName = "NumberName"
}

class Team: NSObject, NSCoding {
    
    /// MARK: - Properties
    var id: String!
    var name: String!
    var ratio: (Int, Int)?
    var playerDisplay: PlayerDisplay = .name
    var logo: UIImage?
    var roster = [ Player ]()
    
    /// MARK: - Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("teams")
    
    /// MARK: - Initializers
    
    private override init() {
        super.init()
    }
    
    convenience init(withId id: String!) {
        self.init()
        
        self.id = id
    }
    
    /// MARK: - NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard
            let id = decoder.decodeObject(forKey: "id") as? String,
            let name = decoder.decodeObject(forKey: "name") as? String
        else {
            print("ERROR: Unable to init Team")
            return nil
        }
        
        self.init()
        self.id = id
        self.name = name
        self.ratio = decoder.decodeObject(forKey: "ratio") as? (Int, Int)
        self.playerDisplay = PlayerDisplay(rawValue: decoder.decodeObject(forKey: "playerDisplay") as! String) ?? PlayerDisplay.name
        self.logo = decoder.decodeObject(forKey: "logo") as? UIImage
        self.roster = decoder.decodeObject(forKey: "roster") as? [Player] ?? []
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(ratio, forKey: "ratio")
        aCoder.encode(playerDisplay.rawValue, forKey: "playerDisplay")
        aCoder.encode(logo, forKey: "logo")
        aCoder.encode(roster, forKey: "roster")
    }
    
}

extension Team: Comparable {
    static func < (lhs: Team, rhs: Team) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.id == rhs.id
    }
}
