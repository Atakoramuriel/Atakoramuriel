//
//  HomeView.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/16/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack{
            //Layer 0 - Background - color
            LinearGradient(gradient: Gradient(colors: [Color(red: 26/255, green: 28/255, blue: 36/255),Color(red: 26/255, green: 28/255, blue: 36/255), Color.black]), startPoint: .top, endPoint: .bottom)
            
            
            
            //This is for the content and should appear above the wallpaper and below the top and bottom Nav
            VStack{
              
                //Allow for scrolling
                ScrollView{
                    Spacer(minLength: .some(100))
                    //Load user data here
                    UserPostCard()
                    UserPostCard()
                    UserPostCard()
                    UserPostCard()
                    UserPostCard()
                    UserPostCard()
                    
                    
                }
            } //Pading to ensure the posts do not appear under top nav but below on load
            
            
            
            //VStack Here For top and bottom Nav
            VStack{
                TopBar()
                Spacer()
                BottomNav()
            }.edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.all)
            
            
        }
        
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
