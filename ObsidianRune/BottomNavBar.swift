//
//  BottomNavBar.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/14/21.
//

import SwiftUI

struct BottomNavBar: View {
    
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    var body: some View {
        TabView{
            Text("").font(.system(size:20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Text("").font(.system(size:20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Menu")
                }
            Text("").font(.system(size:20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            Text("").font(.system(size:20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            Text("").font(.system(size:20, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                
            
            
        }.frame(width: screenWidth, height: screenHeight * 0.056, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1/255)
        }
    }
}

struct BottomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavBar()
    }
}
