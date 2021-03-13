//
//  ContentView.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/10/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    //Lets try this
    @EnvironmentObject var session: SessionStore
    @State var pageIndex = 2
    
    
    func getUser(){
        session.listen()
    }
    
    //Variables

    @State private var isEditing = false;
    @State private var auth = "";
    
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    //Status
    @State var status = UserDefaults.standard.value(forKey: "loginStatus") as? Bool ?? false
    
    
    
    var body: some View {
        Group {
            if(session.session != nil){
                    HubView()
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}




