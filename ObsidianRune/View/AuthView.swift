//
//  AuthView.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/27/21.
//

import SwiftUI

struct SigninView: View {
    
    //variables
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
 
    @EnvironmentObject var session: SessionStore
    
    //Place Signin Function Here
    
    func userSignIn(){
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    
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
                        
                        if(error != ""){
                            Text(error)
                                .foregroundColor(.red)
                                .font(.subheadline)
                                .italic()
                        }
                      
                    }
                    
                    
                    //Start of TextArea
                    VStack
                    {
                        
                        TextField(
                            "Email . . . ",
                            text: $email)
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color.white)
                            
                            .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                            .cornerRadius(10.0)
                            .padding(.bottom, 20)
                           
                        
                        
                        
                        SecureField(
                            "Password . . . ",
                            text: $password)
                            .foregroundColor(.black)
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
                        Button(action: userSignIn){
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
                        
                        NavigationLink(destination: SignUpView()){
                            HStack {
                                Text("New User ?")
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(.white)
                                
                                Text("Create Account")
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(Color(red: 156/255, green: 165/255, blue: 213/255))
                            }
                        }
                        
                    }.offset(y:0)
                    
                    
                 
                    
                    
                 //Bottom of the large VStack
                }.offset(y: screenHeight * -0.005)
                .padding(.top, 10)
                
                
                
            }
        //End Z
    }//Actual End of Z
        
      
    }
}


struct SignUpView: View {
    //Variables Needed
    @State private var NewEmail: String = "";
    @State private var password: String = "";
    @State private var confirmPassword: String = "";
    @State private var error: String = "";
    @EnvironmentObject var session: SessionStore
    
    func signUp(){
        session.signUp(email: NewEmail, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.NewEmail = ""
                self.password = ""
            }
        }
    }
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    @State private var changeState = "";
    var body: some View {
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
                    
                    if(error != ""){
                        Text(error)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .italic()
                            
                    }
                    
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
                        .foregroundColor(.black)
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
                    Button(action: signUp){
                        Text("Sign Up")
                            .padding(.leading, screenWidth * 0.25)
                            .padding(.trailing, screenWidth * 0.25)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .background(Color(red: 156/255, green: 165/255, blue: 213/255))
                            .accentColor(.white)
                        
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
                        
                    }.padding(.bottom, screenHeight * 0.10)
                    
                }
                
               
                
            }
            
        }
            //End of ZStack
        }
    }
}

struct AuthView: View {
    
    //Variables Needed
    //Login Variables
    //variables
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    
    //Registration Variables
    
    @State private var NewEmail: String = "";
    //@State private var password: String = "";
    @State private var confirmPassword: String = "";
    //@State private var error: String = "";
    @EnvironmentObject var session: SessionStore
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
 
    @State var pageIndex = 1
    
    
    //Pretense Functions
    
    //sign user in
    func userSignIn(){
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    func signUp(){
        session.signUp(email: NewEmail, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    
    
    var body: some View {
        ZStack{
//            //Layer 0
//            LinearGradient(gradient: Gradient(colors: [Color.black,Color(red: 21/255, green: 23/255, blue: 25/255), Color(red: 21/255, green: 23/255, blue: 25/255)]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
            
            if(pageIndex == 0){
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
                            
                            if(error != ""){
                                Text(error)
                                    .foregroundColor(.red)
                                    .font(.subheadline)
                                    .italic()
                            }
                          
                        }
                        
                        
                        //Start of TextArea
                        VStack
                        {
                            
                            TextField(
                                "Email . . . ",
                                text: $email)
                                .foregroundColor(.black)
                                .disableAutocorrection(true)
                                .padding()
                                .background(Color.white)
                                
                                .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                                .cornerRadius(10.0)
                                .padding(.bottom, 20)
                               
                            
                            
                            
                            SecureField(
                                "Password . . . ",
                                text: $password)
                                .foregroundColor(.black)
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
                            Button(action: userSignIn){
                                Text("Login")
                                    .bold()
                                    .padding(.leading, screenWidth * 0.25)
                                    .padding(.trailing, screenWidth * 0.25)
                                    .padding(.top, 15)
                                    .padding(.bottom, 15)
                                    .background(Color(red: 156/255, green: 165/255, blue: 213/255))
                                    .accentColor(.black)
                                  
                                
                            }
                            
                        }.padding(.top, 15) //End of second VStack
                        
                    
                       
                        
                        //Next VStack
                        
                        VStack
                        {
                            
                          
                                HStack {
                                    Text("New User ?")
                                        .font(.system(size: 15, weight: .light))
                                        .foregroundColor(.white)
                                    Button(action: {self.pageIndex = 1}, label: {
                                        Text("Create Account")
                                            .font(.system(size: 15, weight: .light))
                                            .foregroundColor(Color(red: 156/255, green: 165/255, blue: 213/255))
                                    })
                                 
                                }
                           
                            
                        }.offset(y: 150)
                        
                        
                     
                        
                        
                     //Bottom of the large VStack
                    }
                    .padding(.top, 75)
                    
                    
                    
                }
            //End Z
            }else{
                //This is the registration page
                //Layer 0 - background color
                LinearGradient(gradient: Gradient(colors: [Color.black,Color(red: 21/255, green: 23/255, blue: 25/255), Color(red: 21/255, green: 23/255, blue: 25/255)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
               
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
                                    
                                    if(error != ""){
                                        Text(error)
                                            .foregroundColor(.red)
                                            .font(.subheadline)
                                            .italic()
                                            
                                    }
                                    
                                }.offset(y: screenHeight * 0.01)
                                
                                //Vstack for inputs
                                VStack{
                                    
                                    TextField(
                                        "Enter an Email... ",
                                        text: $NewEmail)
                                        .foregroundColor(.black)
                                        .disableAutocorrection(true)
                                        .padding()
                                        .background(Color.white)
                                        
                                        .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                                        .cornerRadius(10.0)
                                        .padding(.top, 10)
                                        .padding(.bottom, 5)
                                    
                                    SecureField(
                                        "Enter an Password... ",
                                        text: $password)
                                        .foregroundColor(.black)
                                        .disableAutocorrection(true)
                                        .padding()
                                        .background(Color.white)
                                        
                                        .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                                        .cornerRadius(10.0)
                                        .padding(.top, 10)
                                        .padding(.bottom, 5)
                                    
                                    SecureField(
                                        "Confirm Password ",
                                        text: $confirmPassword)
                                        .foregroundColor(.black)
                                        .disableAutocorrection(true)
                                        .padding()
                                        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
                                        
                                        .frame(width: screenWidth * 0.9, height: 60, alignment: .center)
                                        .cornerRadius(10.0)
                                        .padding(.top, 10)
                                        .padding(.bottom, 20)
                                    
                                    //Login Button
                                    Button(action: signUp){
                                        Text("Sign Up")
                                            .padding(.leading, screenWidth * 0.25)
                                            .padding(.trailing, screenWidth * 0.25)
                                            .padding(.top, 15)
                                            .padding(.bottom, 15)
                                            .background(Color(red: 156/255, green: 165/255, blue: 213/255))
                                            .accentColor(.white)
                                        
                                    }.padding(.top, 125)
                                    
                                    //Final Vstack for the subtext
                                    VStack{
                                        Text("Returning user?")
                                            .foregroundColor(.white)
                                            .italic()
                                        Button(action: {self.pageIndex = 0},
                                        label: {
                                            Text("Login to Obsidian")
                                            //NavigationLink()
                                        }).foregroundColor(Color(red: 156/255, green: 165/255, blue: 213/255))
                                        
                                    }.padding(.top, screenHeight * 0.10)
                                    
                                }
                                
                            }
                            
                        }
                
            } //<-- End of the else statement
            
//            NavigationView {
//                SigninView()
//
//            }
            
            
            
            
        }
      
      
           
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
