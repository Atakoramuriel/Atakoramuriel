//
//  RegisterViewModel.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/27/21.
//

import SwiftUI
import Firebase

class RegisterViewModel : ObservableObject{
    //Variables
    @Published var newEmail = ""
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var bio = ""
    //Getting the image4
    @Published var newProfileImg = Data(count: 0)
    @Published var picker = false;
    let ref = Firestore.firestore()
    
    //For loading Views
    @Published var loadingPage = false
    @AppStorage("current_status") var status = false //Will this work?
    
    
    func createUser(){
        //Start
        loadingPage = true
        
        //Get the userID
        let userID = Auth.auth().currentUser!.uid
        
        //Add user to users collection
        self.ref.collection("users").document(userID).setData([
            "displayName": self.username,
            "bio": self.bio,
            "email": self.newEmail,
            "photoURL": self.newProfileImg,
            "prompt": "Unknown....",
            "userKey": userID
            
        ]) {(error) in
            if error != nil{
                //Error creating user
                self.loadingPage = false
                return
            }
            //Registration went well
            self.loadingPage = false
            self.status = true
            
        }
        
    }
}
