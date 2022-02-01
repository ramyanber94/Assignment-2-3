//
//  Teams.swift
//  Assignment 2-3
//
//  Created by ramy on 2022-01-31.
//

import Foundation

struct result : Codable {
    var data : [match]
}

struct match : Codable , Identifiable {
    var id : Int
    var homeGoalCount : Int
    var awayGoalCount : Int
    var home_image : String
    var away_image : String
    var home_name : String
    var away_name : String
    
    #if DEBUG
    static let example = match(id: 1, homeGoalCount: 2, awayGoalCount: 3, home_image: "Rectangle 14", away_image: "Rectangle 14", home_name: "Liver pool", away_name: "any" )
    #endif
}


