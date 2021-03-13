//
//  SettingsViewModel.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 3/1/21.
//

import SwiftUI
import Firebase

class SettingsViewModel : ObservableObject {
    //Get the data of the user
    @Published var userInfo = UserModel(username: "", profilePic: "", bio: "", prompt: "", userClass: "", email: "")
    
    //image picker for updating profile image
    @Published var  picker = false
    @Published var imgData = Data(count: 0)
    
    //Loading the view
    @Published var isLoading = false
    
    //Variables
    let ref = Firestore.firestore() //Base for path
    let userID = Auth.auth().currentUser!.uid //UserID
    
    //Initializer
    init(){
        
        getUserData(userID: userID) { (UserModel) in
            self.userInfo = UserModel
            
        }
    }
    
   
    
    
    //Update the profile photo
    func updateProfilePic(){
        isLoading = true
        //update the user profile photo
        UploadImage(imageData: imgData, path: "profilePhotos") { (url) in
            //Update the profilePhoto in Firestore
            self.ref.collection("users").document(self.userID).updateData([
                "photoURL": url,
                
            ]){(err) in
                //Err validation
                if err != nil {return}
                
                //else
                self.isLoading = false
                getUserData(userID: self.userID) { (UserModel) in
                    self.userInfo = UserModel
                    
                }
            }
            
        }
    }
}
