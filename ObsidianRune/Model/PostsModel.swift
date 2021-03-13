//
//  PostsModel.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 3/3/21.
//

import SwiftUI

struct PostsModel : Identifiable {
    var id: ObjectIdentifier //Temp fix for the conform error
    
    
    //variables
    var postID : ObjectIdentifier
    var title : String
    var postImg : String
    var timeStamp : String
    var postDate : Date
    
    var user : UserModel
}
