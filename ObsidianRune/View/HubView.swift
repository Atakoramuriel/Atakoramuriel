//
//  HubView.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/28/21.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI
import ImageCaptureCore


struct HubView: View {
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    //State object
    @StateObject var settingsData = SettingsViewModel();
    
    var posts = [
    UserPostCard(),
    UserPostCard(),
    UserPostCard()
    ]
    @State var pageIndex: Int = 0;
    var body: some View {
        //Collect user data
        
        
        ZStack{
            //Layer 0 - Background - This stays consistant
            LinearGradient(gradient: Gradient(colors: [Color(red: 26/255, green: 28/255, blue: 36/255),Color(red: 26/255, green: 28/255, blue: 36/255), Color.black]), startPoint: .top, endPoint: .bottom)
            
            
            
            //This is for the content and should appear above the wallpaper and below the top and bottom Nav
            VStack{
                //This is the part that is subject to chance by the if statement
                switch pageIndex {
                case 0:
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
                case 1:
                    Text("Insert Messages here")
                case 2:
                    ScrollView {
                        VStack{
                            //Profile Info
                            HStack{
      
                                //Sub Profile info
                                VStack{
                                    Button(action:{
                                        //For uploading profile photo
                                        settingsData.picker.toggle()
                                    }){
                                        //This is the profile Pic
                                        WebImage(url: URL(string: settingsData.userInfo.profilePic)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 105, height: 105, alignment: .center)
                                            .clipShape(Circle())
                                        
                                        if settingsData.isLoading{
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                                        }
//
//                                        //Profile photo and username
//                                        Image("RuiLogo") //to be replaced with profile image
//                                            .resizable()
//                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                                            .frame(width: 95, height: 95, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                            .shadow(radius: 10)
//                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    }
                                 
                                    //Sub info collection - Username is here along with prompt
                                    Text(settingsData.userInfo.username)
                                        .font(.system(size: 30))
                                        .foregroundColor(Color.orange).offset(y: -15)
                                    
                                    Text(settingsData.userInfo.prompt).foregroundColor(.white)
                                        .italic()
                                 
                                    
                                }.sheet(isPresented: $settingsData.picker){
                                    ImagePicker(picker: $settingsData.picker, imgData: $settingsData.imgData)
                                }
                                .onChange(of: settingsData.imgData) { (newData) in
                                    //When the image is selected, update the data in Firestore
                                    settingsData.updateProfilePic()
                                }
                                
                                
                            }.frame(width: screenWidth, height: screenHeight * 0.23, alignment: .center)
                            .background(Color(red: 21/255, green: 23/255, blue:25/255))
                            .padding(.bottom, 15)
                            
                            //Example 0
                            
                            HStack{
                                //ClassName
                                VStack{
                                    Text(settingsData.userInfo.userClass)
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
                    
                default:
                    //Text("Insert Home")
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
                }
            
                //Allow for scrolling
                
            } //Pading to ensure the posts do not appear under top nav but below on load
            
            
            
            //VStack Here For top and bottom Nav
            VStack{
                //Top bar stays but may be replaced in full
                VStack(spacing: 20){
                    HStack{
                       titleBanner()
                        Spacer()
                        Button(action: {
                            try! Auth.auth().signOut()
                        }){
                            Image(systemName: "moon").font(.system(size: 40)).foregroundColor(.white)
                        }
                    }
                }.padding()
                .padding(.top, 35)
                .background(Color.black)
                Spacer()
                //Replace with Code to bottomNav
                //BottomNav()
                HStack{
                    //193 146 74
                    Button(action: {self.pageIndex = 0}){
                        Image(systemName: "house.circle.fill")
                            .font(.system(size: 45))
                            .foregroundColor(Color(red: 193/255, green: 146/255, blue: 74/255))
                        
                    }.padding(.leading, 15)
                    //.foregroundColor(Color(red: 33/255, green: 44/255, blue: 95/255).opacity(self.index == 0 ? 1 : 0.1))
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                       self.pageIndex = 1;
                    }){
                        Image(systemName: "message.circle")
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                        
                    }.padding(.trailing, 0)
                    //.foregroundColor(Color(red: 33/255, green: 44/255, blue: 95/255).opacity(self.index == 1 ? 1 : 0.1))
                
                    
                    Button(action: {
                        //self.pageIndex = 2;
                    }){
                        Image(systemName: "plus.circle.fill")
                            .padding(.all,5)
                            .font(.system(size: 55))
                            .foregroundColor(Color(red: 193/255, green: 116/255, blue: 74/255))
                            .background(Color.black)
                            .border(Color.black)
                            .cornerRadius(50)
                            .offset(y: -35)
                        
                    }.padding(.trailing, 0)
                  
                
                   
                    
                    Button(action: {
                       self.pageIndex = 2;
                        getData()
                    }){
                        Image(systemName: "person.circle")
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                        
                    }.padding(.trailing, 10)
                    //.foregroundColor(Color(red: 33/255, green: 44/255, blue: 95/255).opacity(self.index == 2 ? 1 : 0.1))
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        //self.index = 3;
                    }){
                        Image(systemName: "line.horizontal.3.circle")
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                        
                    }.padding(.trailing, 15)
                    //.foregroundColor(Color(red: 33/255, green: 44/255, blue: 95/255).opacity(self.index == 3 ? 1 : 0.1))
                }.padding(.top,40)
                .padding(.bottom, 55)
                .frame(width: screenWidth, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.black)
            }.edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.all)
            
            
        }
        
       

    }
}



func getData(){
    let user = Auth.auth().currentUser!.uid
    let ref = Firestore.firestore()
    
    //Get the data here
    let userRef = ref.collection("users").document(user)
    
    userRef.getDocument { (document, error) in
        if let document = document, document.exists{
            //User info exists
            let dataDesc = document.data().map(String.init(describing:)) ?? "null"
            print("Data Collected: \(dataDesc)")
        } else {
            print("User Data not found...")
        }
    }
    
    
}

struct HubView_Previews: PreviewProvider {
    static var previews: some View {
        HubView()
    }
}
