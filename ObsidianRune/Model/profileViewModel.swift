//
//  profileViewModel.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/28/21.
//

import SwiftUI
import Firebase

class profileViewModel : ObservableObject {
   @Published var user = ""
    
  
    func getData(){
        let user = Auth.auth().currentUser!.uid
        let ref = Firestore.firestore()
        
        //Get the data here
        let userRef = ref.collection("users").document(user)
        
        userRef.getDocument { (document, error) in
            if let document = document, document.exists{
                //User info exists
                let dataDesc = document.data().map(String.init(describing:)) ?? "null";
                //print("VV")
                print("UserName: == \(document.data()?["displayName"])")
                //print("Data Collected: \(dataDesc)")
            } else {
                print("User Data not found...")
            }
        }
        
        
    }

}
