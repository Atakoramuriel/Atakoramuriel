//
//  PostsViewModel.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 3/3/21.
//

import SwiftUI
import Firebase
 
class PostViewModel : ObservableObject {
    
    //Store the data here
    @Published var posts : [PostsModel] = []
    let ref = Firestore.firestore();
    
    init() {
        getUserPosts()
    }
    
    func getUserPosts(){
        //Collect the data here
        ref.collection("posts").addSnapshotListener { (snap, err) in
            guard let docs = snap else {return}
            
            docs.documentChanges.forEach { (doc) in
                if doc.type == .added {
                    //a user has made a new post
                    
                    //Fetch the data from the user
                    let title = doc.document.data()["title"] as! String
                    let text = doc.document.data()["text"] as! String
                    let userKey = doc.document.data()["userkey"] as! String
                    let timeStamp = doc.document.data()["timestamp"] as! Timestamp
                    let date = doc.document.data()["date"] as! String
                    let postID = doc.document.data()["post_id"] as! String
                    let numLikes = doc.document.data()["NumLikes"] as! String
                    let userRef = doc.document.data()["userkey"] as! DocumentReference
                    
                    if(doc.document.data()["postImg"] == nil){
                            let postImage = ""
                    } else { let postImage = doc.document.data()["postImg"] as! String}
                  
                    
                    //Get the user data
                    getUserData(userID: userRef.documentID) { (UserModel) in
                        self.posts.append(PostsModel(id: doc.document.documentID, postID: doc.document.documentID, title: title, postImg: self.postImg, timeStamp: timeStamp, postDate: date, user: userKey))
                    }
                    
                    
                    
                }
            }
        }
    }
    
}
