//
//  Menu.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/15/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Menu: View {
    //Variables
    
        //For getting the Height/width of the screen
        @State private var screenHeight = UIScreen.main.bounds.height;
        @State private var screenWidth = UIScreen.main.bounds.width;
    //State object
    @StateObject var settingsData = SettingsViewModel();
    
    var body: some View {
        ZStack(alignment: .top){
            //Start with background for now
            //Layer 0
            LinearGradient(gradient: Gradient(colors: [Color(red: 26/255, green: 28/255, blue: 36/255),Color(red: 26/255, green: 28/255, blue: 36/255), Color.black]), startPoint: .top, endPoint: .bottom)
            
            //Entirety
            VStack{
             
                ScrollView {
                //Top
              
                
                
                
                //Middle
                    VStack{
                        //Profile Info
                        HStack{
  
                            //Sub Profile info
                            VStack{
                                Button(action:{}){
                                    
                                    //Start of if statement
                                    if settingsData.userInfo.profilePic != ""{
                                        //Place actual profile picture here
                                        
                                        WebImage(url: URL(string: settingsData.userInfo.profilePic)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 105, height: 105, alignment: .center)
                                            .clipShape(Circle())
                                    }else {
                                        
                                        //Profile photo and username
                                        Image("RuiLogo") //to be replaced with profile image
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .frame(width: 95, height: 95, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .shadow(radius: 10)
                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    }
                                    //End of if statement
                                  
                                }
                             
                                //Sub info collection
                                Text(settingsData.userInfo.username)
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.orange).offset(y: -15)
                                
                                Text(settingsData.userInfo.prompt).foregroundColor(.white)
                                    .italic()
                             
                                
                            }
                        }.frame(width: screenWidth, height: screenHeight * 0.23, alignment: .center)
                        .background(Color(red: 21/255, green: 23/255, blue:25/255))
                        .padding(.bottom, 15)
                        
                        //Example 0
                        
                        HStack{
                            //ClassName
                            VStack{
                                Text("ClassName")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                
                                HStack{
                                    
                                    
                                    //First Column Friends
                                    VStack{
                                        Text("151")
                                            .foregroundColor(Color.white)
                                            .font(.title)
                                            .bold()
                                        
                                        Text("Friends")
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .bold()
                                    }
                                    
                                    
                                    //Second Column
                                    VStack{
                                        
                                        
                                        Text("51")
                                            .foregroundColor(Color.white)
                                            .font(.title)
                                            .bold()
                                        
                                        Text("Posts")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(Color.white)
                                            .bold()
                                    }
                                    
                                    //Third Column
                                    VStack{
                                        Text("51")
                                            .foregroundColor(Color.white)
                                            .font(.title)
                                            .bold()
                                        
                                        Text("Posts")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(Color.white)
                                            .bold()
                                    }
                                    
                                    
                                }
                                    
                            }
                            
                        }.frame(width: screenWidth, height: screenHeight * 0.15, alignment: .center)
                        .background(Color(red: 13/255, green: 15/255, blue: 23/255))
                        .padding(.bottom, 30)
                        
                        HStack{
                            
                            Button(action: {}){
                                //Worded Quote
                                Text("Collection of writings, insight, and poetry...Through and Through.")
                                    .italic()
                                    .offset(x: 50)
                                
                                
                                //title
                                Text("Posts")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(y: 45)
                            }
                            
                           
                        }.frame(width: screenWidth * 0.9, height: 150, alignment: .center)
                        .background(Color(red: 31/255, green: 31/255, blue:54/255))
                        .cornerRadius(10)
                        .padding(.bottom, 15)
                        
                        //Example 1
                        HStack{
                            
                            Button(action:{}){
                                
                                //image
                                Image("RuiRed")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill
                                    )
                                    .frame(width: 175, height: 150, alignment: .leading)
                                    .shadow(radius: 10)
                                    .cornerRadius(10)
                                    .offset(x: -60, y: 0)
                                    .opacity(1.0)
                                
                                
                                
                                //title
                                Text("Legacies")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                            
                            }
                            
                         
                        }.frame(width: screenWidth * 0.9, height: 150, alignment: .center)
                        .background(Color(red: 31/255, green: 31/255, blue:54/255))
                        .cornerRadius(10)
                        .padding(.bottom, 15)
                        
                        //Example 2
                        HStack{
                            
                            Button(action: {}){
                                //image
                                Image("RuiAutumn")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 195, height: 150, alignment: .leading)
                                    .shadow(radius: 10)
                                    .cornerRadius(10)
                                    .offset(x: -85, y: 0)
                                    .opacity(0.6)
                                
                                
                                
                                //title
                                Text("Aevum")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            
                           
                        }.frame(width: screenWidth * 0.9, height: 150, alignment: .center)
                        .background(Color(red: 31/255, green: 31/255, blue:54/255))
                        .cornerRadius(10)
                        
                        
                        //Example 3 Settings
                        HStack{
                            
                            Button(action:{}){
                                
                                //image
                                Image("RuiLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 175, height: 165, alignment: .leading)
                                    .shadow(radius: 10)
                                    .cornerRadius(45)
                                    .offset(x: -55, y: 0)
                                    .opacity(0.8)
                                
                                
                                
                                //title
                                Text("Settings")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            
                          
                        }.frame(width: screenWidth * 0.9, height: 150, alignment: .center)
                        .background(Color(red: 31/255, green: 31/255, blue:54/255))
                        .cornerRadius(10)
                        .opacity(0.6)
                        
                    }.padding(.bottom, 150)
                    
                }.padding(.top, screenHeight * 0.115)
                
                
                
                //BottomNav area
               
              
            }
            //Area for TopBar
            VStack{
                TopBar()
            }.edgesIgnoringSafeArea(.top)
           Spacer()
            BottomNav().padding(.top,screenHeight * 0.90)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
