//
//  File.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/20/21.
//

import Foundation
import SwiftUI

struct Contact: Identifiable {
  
    
    let imageName: String
    let name: String
    let message: String
    let date: String
    let id = UUID()
    //let userId = userID()
    
}

//For testing purposes of course
let contacts = [
    Contact(imageName: "RuiAutumn", name: "GhostWriter", message: "Remember MWF are post dats", date: "May 1st"),
    Contact(imageName: "RuiGlow2C", name: "Reli", message: "Do as much as you can while...", date: "April 23, 2020"),
    Contact(imageName: "RuiGoldC", name: "Gehenna", message: "Summer is coming, and the adventures with it", date: "April 20, 2020"),
    Contact(imageName: "RuiGlowC", name: "TheOtherSide", message: "Working on Book II", date: "April 17, 2020"),
    Contact(imageName: "RuiGlowC2", name: "Van Vera", message: "Trying to learn control...", date: "April 14, 2020")
]
