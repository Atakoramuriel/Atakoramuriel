//
//  GetUser.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 3/12/21.
//

import SwiftUI
import Firebase

//Gobal Variabels

let ref = Firestore.firestore()
let userID = Auth.auth()

//Function to grab?
func getUserData(userID: String, completion: @escaping (UserModel) -> ()){
    
    //Get the data here
    let userRef = ref.collection("users").document(userID)
    
    userRef.getDocument { (document, error) in
        guard let user = document else{return} //Store all of the user data here
        
        //Assign each value accordingly
        let displayName = user.data()?["displayName"] as! String
        let profilePic = user.data()?["photoURL"] as! String
        let email = user.data()?["email"] as! String
        let userPrompt = user.data()?["prompt"] as! String
        let userBio = user.data()?["bio"] as! String
        let userClassItem = "Obsidian"
       
        
        print("DisplayName: \(displayName)")
        
        DispatchQueue.main.async {
            completion(UserModel(username: displayName, profilePic: profilePic, bio: userBio, prompt: userPrompt, userClass: userClassItem, email: email))
        }
        
        print("DisplayName: \(displayName)")
        
        
//            if let document = document, document.exists{
//                //User info exists
//                let dataDesc = document.data().map(String.init(describing:)) ?? "null"
//                print("Data Collected: \(dataDesc)")
//            } else {
//                print("User Data not found...")
//            }
    }
    
}
