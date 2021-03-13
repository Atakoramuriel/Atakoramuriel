//
//  Messages.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/20/21.
//

import SwiftUI

struct Messages: View {
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    @State private var username = "";

    var body: some View {
        
       //Entirety of Message VStack
        VStack{
            ZStack{
                //Layer 0
                LinearGradient(gradient: Gradient(colors: [Color.black,Color.black,Color(red: 34/255, green: 28/255, blue: 36/255),Color(red: 25/255, green: 27/255, blue: 36/255),Color(red: 34/255, green: 28/255, blue: 36/255), Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                //Accent Color - 144 160 221
                
                //Main Content
                VStack{
                    //Messages Prompt
                    HStack{
                        Text("Messages")
                            .bold()
                            .font(.system(size:  50))
                            .foregroundColor(Color(red: 144/255, green: 160/255, blue: 221/255))
                    }
                    .frame(width: screenWidth, height: screenHeight * 0.1, alignment: .center)
                    .padding(.top, screenHeight * 0.045)
          
                  
                }
                
                //For Top and BottomNav
                VStack{
                    TopBar()
                    Spacer()
                  
                }.edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}
