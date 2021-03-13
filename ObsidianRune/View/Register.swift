//
//  Register.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/14/21.
//

import SwiftUI


struct Register: View {
    
    //Variables Needed
    @State private var NewEmail: String = "";
    @State private var password: String = "";
    @State private var confirmPassword: String = "";
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    @State private var changeState = "";
    
    @StateObject var registerData = RegisterViewModel()
    
    
    
    var body: some View {
        
        if(changeState == "Login"){
            LoginPage()
        }else if(changeState == "Created"){
            //When main is created go there
        }else{
            //Nada para ahora
        }
        
        
        //Creation of STack
        ZStack{
            //Layer 0
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black, Color.black,Color(red: 82/255, green: 86/255, blue: 111/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all
                )
           
        ScrollView{
            
            //Start of Main VStack
            VStack{
                
                //ObsidianImage and Text
                VStack{
                    CircleImage()
                    //Text Display
                    Text("Obsidian Rune")
                        .font(.system(size: 35))
                        .foregroundColor(Color(red: 156/255, green: 165/255, blue: 213/255))
                        .offset(y:-50)
                    Text("Create new account")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .offset(y:-45)
                }.offset(y: screenHeight * 0.01)
                
                //Vstack for inputs
                VStack{
                    
                    TextField(
                        "Enter an Email... ",
                        text: $NewEmail)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color.white)
                        
                        .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                        .cornerRadius(10.0)
                        .padding(.bottom, 5)
                    
                    TextField(
                        "Enter an Password... ",
                        text: $password)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color.white)
                        
                        .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                        .cornerRadius(10.0)
                        .padding(.bottom, 5)
                    
                    TextField(
                        "Confirm Password ",
                        text: $confirmPassword)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color.white)
                        
                        .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                    
                    //Login Button
                    Button(action: {
                       //CreateAcc
                    }){
                        Text("Sign Up")
                            .padding(.leading, screenWidth * 0.25)
                            .padding(.trailing, screenWidth * 0.25)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .background(Color(red: 156/255, green: 165/255, blue: 213/255))
                            .accentColor(.white)
                        
                    }
                }
                
                //Final Vstack for the subtext
                VStack{
                    Text("Returning user?")
                        .foregroundColor(.white)
                        .italic()
                    Button(action: {
                        //Ignore rn
                        
                    }, label: {
                        Text("Login to Obsidian")
                        //NavigationLink()
                    }).foregroundColor(Color(red: 156/255, green: 165/255, blue: 213/255))
                    
                }.offset(y: screenHeight * 0.1)
                
            }
            
        }
            //End of ZStack
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

func pushLogin(){
    //Navigation to Login Here
   
}
