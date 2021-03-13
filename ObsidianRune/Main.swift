//
//  Main.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/14/21.
//

import SwiftUI

struct Main: View {
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    var posts = [
    UserPostCard(),
    UserPostCard(),
    UserPostCard()
    ]
    
    var body: some View {
        ZStack(alignment: .top){
            //Layer 0
            LinearGradient(gradient: Gradient(colors: [Color(red: 56/255, green: 59/255, blue: 76/255),Color(red: 56/255, green: 59/255, blue: 76/255),Color(red: 34/255, green: 28/255, blue: 36/255),Color(red: 25/255, green: 27/255, blue: 36/255),Color(red: 34/255, green: 28/255, blue: 36/255), Color.black]), startPoint: .top, endPoint: .bottom)
            
            //First Horizontal Stack
            VStack{
                
                
                //Area for posts
                VStack{
                    ScrollView{
                        Spacer()
                        UserPostCard()
                            .padding(.bottom,9)
                        UserPostCard()
                            .padding(.bottom, 9)
                        UserPostCard()
                            .padding(.bottom,9)
                        UserPostCard()
                            .padding(.bottom,9)
                        UserPostCard()
                            .padding(.bottom,9)
                    }.frame(height: screenHeight * 0.88, alignment: .center)
                }.offset(x: screenWidth * 0, y: 0.0)
                .padding(.top, screenHeight * 0.1)
                .padding(.leading, screenWidth * 0.03)
                .padding(.trailing, screenWidth * 0.03)
                
                Spacer()
               
            }
            
            
            VStack{
                TopBar()
                Spacer()
                //BottomNav
                BottomNav()
            }.edgesIgnoringSafeArea(.all)
            
            
        }
        
    }
}




struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}


