//
//  UserPostCard.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/14/21.
//

import SwiftUI

struct UserPostCard: View {
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    var body: some View {
        
        //Test this
        VStack{
            //For layering
            ZStack{
                //post info in the back
                ScrollView{
                    VStack(alignment: .center){
                            //Try ScrollView
                            
                            //TitleTxt
                            Text("Decend NeverMore")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(red: 141/255, green: 161/255, blue: 221/255))
                                .bold()
                                .padding(.bottom,15)
                            
                            //Room for PostImg
                        
                            //TextTxt
                            Text("This year is the year of Success and positivity and full recovery")
                                .foregroundColor(.white)
                                .font(.system(size:30))
                            //144 161 221
                    }.padding(.top, 75)
                }.frame(height: screenHeight * 0.5)
                .padding(.top,75)
               
                
                //Nav and bottombar a layer above
                VStack{
                    //First HStack with username and profile photo
                    
                    //TopNav
                    HStack{
                        Button(action:{}){
                            //Profile Image
                             Image("RuiLogo") //to be replaced with profile image
                                 .resizable()
                                 .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                 .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                 .shadow(radius: 10)
                                 .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                             Text("Username")
                                 .font(.title)
                                 .foregroundColor(Color(red: 193/255, green: 146/255, blue: 74/255))
                        }
                       
                         Spacer()
                        Button(action:{}){
                            //Icon with the three dots
                            Image(systemName: "ellipsis")
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                                .padding(.trailing, 15)
                        }
                        

                    }.padding(15)
                    Spacer()
                    
                    //BottomNav
                    HStack{
                        //Comment Button
                         Button(action: {}){
                             Image(systemName: "heart")
                                 .font(.system(size: 25))
                                 .foregroundColor(.white)
                         }.padding(.trailing, 0)
                        //LikesNum
                        Text("0")
                            .foregroundColor(Color(red: 144/255, green: 161/255, blue: 221/255))
                            .font(.title)
                            .offset(x:-5)
                            .padding(.trailing,3)
                            
                        //144 161 221
                       
                       //Comment Button
                        Button(action: {}){
                            Image(systemName: "message")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                        }
                        //CommentsNum
                        Text("0")
                            .foregroundColor(Color(red: 144/255, green: 161/255, blue: 221/255))
                            .font(.title)
                            .offset(x:-5)
                            .padding(.trailing,3)
                           
                        Spacer()
                        
                        //More Button
                        Text("2/5/2021, 12:06:33AM")
                            .foregroundColor(.white)
                            
                    }.padding(10)
                }
            }
          
          
        }
        .frame(width: screenWidth * 0.9, height: screenHeight * 0.6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(red: 20/255, green: 20/255, blue: 25/255))
        .cornerRadius(25)
        .padding(.bottom, 30)
        
    }
}

struct UserPostCard_Previews: PreviewProvider {
    static var previews: some View {
        UserPostCard()
    }
}
