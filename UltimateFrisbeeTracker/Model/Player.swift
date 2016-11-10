//
//  Player.swift
//  UltimateFrisbeeTracker
//
//  Created by Christian.Grise on 11/9/16.
//  Copyright © 2016 Christian.Grise. All rights reserved.
//

import Foundation

enum PlayerPosition: String {
    case any = "Any"
    case handler = "Handler"
    case cutter = "Cutter"
}

enum Gender: String {
    case unknown = "Unknown"
    case male = "Male"
    case female = "Female"
}

class Player: NSObject {
    
    var name: String!
    var number: Int?
    var position: PlayerPosition = .any
    var gender: Gender = .unknown
    var isPlaying: Bool = true
    
}
