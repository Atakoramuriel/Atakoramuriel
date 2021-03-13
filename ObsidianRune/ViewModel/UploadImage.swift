//
//  UploadImage.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 3/1/21.
//

import SwiftUI
import Firebase


//Start straight with function
func UploadImage(imageData: Data,path: String, Completion: @escaping (String) -> ()){
    
    //Variables
    let storage = Storage.storage().reference() // to firebase storage
    let userID = Auth.auth().currentUser!.uid //uid of current user
    
    storage.child(userID).putData(imageData, metadata: nil){ (_, err) in
        
        //Quick Error Validation
        if err != nil{
            Completion("")
            return
        }
        
        //Dowload the URL from Firestore and return it
        storage.child(path).child(userID).downloadURL { (url, err) in
            //Another error Validation
            if err != nil{
                Completion("")
                return
            }
            
            //And?
            Completion("\(url!)")
        }
        
    }
}


