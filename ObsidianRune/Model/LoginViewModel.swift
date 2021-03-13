//
//  LoginViewModel.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/27/21.
//

import SwiftUI
import Firebase

class LoginViewModel : ObservableObject{
    @Published var  code = ""
    @Published var number = ""
    
    //For Errors
    
    @Published var errorMsg = ""
    @Published var error = false
    @Published var CreateUser = false;
    
    //@AppStorage("current_status") var status;
    
    func userVerification(){
        let ref = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        
        //check to see if user exists
        ref.collection("users").whereField("userKey", arrayContains: userID)
            .getDocuments {
                (snap, error) in
                if error != nil{
                    //User is not found
                    self.CreateUser.toggle() //switch to true
                    return
                }
                if snap!.documents.isEmpty{
                    //there is no data returned
                    self.CreateUser.toggle()
                    return
                }
                //self.status = true
            }
        
    }
}
