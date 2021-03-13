//
//  LoginPage.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/14/21.
//

import SwiftUI
import Firebase

struct LoginPage: View {
    //Variables
    @StateObject var loginData = LoginViewModel();
    @State var email = "";
    @State private var username = "";
    @State private var password = "";
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
 
  
    var body: some View {
     
        //ZStack to change background Color
        ZStack{
            //Layer 0
            LinearGradient(gradient: Gradient(colors: [Color.black,Color(red: 21/255, green: 23/255, blue: 25/255), Color(red: 21/255, green: 23/255, blue: 25/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        
            //Layer 1
            //Creation of Vertical Stacks inside Scrollview
            ScrollView{
                VStack
                {
                    
                    //157 165 213 - Accent Color
                    
                    //VStack of ObsidianTitle and image
                    VStack
                    {
                        //Import the image
                        CircleImage()
                        //Text Display
                        Text("Obsidian Rune")
                            .font(.system(size: 35))
                            .foregroundColor(Color(red: 156/255, green: 165/255, blue: 213/255))
                            .offset(y:-50)
                        Text("Constant Development")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .offset(y:-45)
                        
                        Text("")
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .italic()
                    }
                    
                    
                    //Start of TextArea
                    VStack
                    {
                        
                        TextField(
                            "Email . . . ",
                            text: $username)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color.white)
                            
                            .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                            .cornerRadius(10.0)
                            .padding(.bottom, 20)
                           
                        
                        
                        
                        TextField(
                            "Password . . . ",
                            text: $password)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color.white)
                            
                            .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                            .cornerRadius(10.0)
                            .padding(.bottom,5)
                        
                        HStack{
                            Button(action: {}){
                                Text("Forgot Password... ")
                                    .frame(width: 150, height: 30, alignment: .trailing)
                            }
                        }.frame(width: screenWidth, height: 30, alignment: .trailing)
                        .padding(.bottom, 15)
                            
                        
                            
                            
                        
                        //Login Button
                        Button(action: {
                        
                        }){
                            Text("Login")
                                .bold()
                                .padding(.leading, screenWidth * 0.25)
                                .padding(.trailing, screenWidth * 0.25)
                                .padding(.top, 15)
                                .padding(.bottom, 15)
                                .background(Color(red: 156/255, green: 165/255, blue: 213/255))
                                .accentColor(.black)
                              
                            
                        }
                        
                    }.padding(.bottom, 156) //End of second VStack
                    
                    //Next VStack
                    
                    VStack
                    {
                        
                        
                        Text("New to Obsidian?")
                            .foregroundColor(.white)
                            .italic()
                        
                        Button("Create Account") {
                            //Action Here
                            
                        }.foregroundColor(Color(red: 156/255, green: 165/255, blue: 213/255))
                        
                    }.offset(y:0)
                    
                    
                    
                 //Bottom of the large VStack
                }.offset(y: 50)
                .padding(.top, 10)
                
                
            }
        //End Z
    }//Actual End of Z
        
      
      
}

    
    //LoginV
        func verification(){
            if self.email != "" && self.password != ""{
                //Time to login
                
                Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                    //Error
                    if err != nil{
                       // self.error = err!.localizedDescription
                    }
                    
                    //Change Status of Login
                    UserDefaults.standard.setValue(true, forKey: "loginStatus")
                    
                }
                
                
            }else{
               // self.error = "Fill in missing value"
            }
        }
    
struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
    
}
