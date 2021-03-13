//
//  SessionStore.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/27/21.
//

import SwiftUI
import Firebase
import Combine

class SessionStore: ObservableObject{
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    
    
    //Create listener
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email)
            } else {
                self.session = nil
            }
        })
    }
        
    //For user to sign up
        func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback){
            //Handle Account Creation Here
            Auth.auth().createUser(withEmail: email, password: password, completion: handler)
          
            
        }
        
    
    //Function to save new user data
    func saveUser(email: String, bio: String, userClass: String, displayName: String, prompt: String, userKey: String, photoURL: String){
        //Variables
        let userID = Auth.auth().currentUser!.uid
        let ref = Firestore.firestore()
        
        //Save the info
        ref.collection("users").document(userID).setData([
            "bio": bio,
            "class": userClass,
            "displayName": displayName,
            "prompt": prompt,
            "email": email,
            "photoURL": photoURL,
            "userKey": userKey
        ])
        
    }
    
    //Pull the user Data
    
    
    
    
    //For signing in the user
        func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback){
            //Handle Account Sign in here 
            Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        }
        
    //Sign out the user
        func signOut(){
            do {
                try Auth.auth().signOut()
                self.session = nil 
            } catch {
                //Have to catch error
                print("Error Signing out user ... ")
            }
        }
        
    //additional functions
        func unbind(){
            if let handle = handle {
                Auth.auth().removeStateDidChangeListener(handle)
            }
        }
        
    //Deinitializer
        deinit {
            unbind()
        }
}




struct User {
    var userID: String
    var userEmail: String?
    
    init(uid: String, email: String?){
        self.userID = uid
        self.userEmail = email
    }
}
