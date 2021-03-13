//
//  MessageCard.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/20/21.
//

import SwiftUI

struct MessageCard: View {
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    var body: some View {
        VStack{
            //HStack
             HStack{
                 //Three Vertical Stacks
                  
                 //1st Profile Picture
                 VStack{
                     Image("RuiGlowC2")
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                         .shadow(radius: 10)
                         .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                         
                 }
                 
                 //2nd Username and post
                 //193 146 74 --Foreground
                 //136 136 152
                 VStack(alignment: .leading){
                     Text("Username")
                         .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                         .foregroundColor(Color(red: 193/255, green: 146/255, blue: 74/255))
                         .bold()
                     Text("This is the location of the message text")
                         .font(.subheadline)
                         .foregroundColor(.white)
                         
                 }.frame(width: 250, height: 85, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                 Spacer()
                 //Date and number of messages
                 VStack{
                     Text("May 1, 2020")
                         .offset(y: 0)
                         .font(.subheadline)
                         .foregroundColor(Color(red: 136/255, green: 136/255, blue: 152/255))
                         
                        
                 }.frame(width: 70, height: 85, alignment: .trailing)
                 
             }
             .frame(width: screenWidth, height: screenHeight * 0.10, alignment: .center)
             .background(Color(red: 20/255, green: 20/255, blue: 25/255))
             
        }.frame(width: screenWidth, height: screenHeight * 0.1, alignment: .center)
        

    }
}

struct MessageCard_Previews: PreviewProvider {
    static var previews: some View {
        MessageCard()
    }
}
