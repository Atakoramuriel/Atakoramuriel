//
//  BottomNav.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/16/21.
//

import SwiftUI

struct BottomNav: View {
    
    //Variables
    //@State var index : Int
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    @State var pageIndex = 0;
    
    var body: some View {
        
        HStack{
            //193 146 74
            Button(action: {
               return self.pageIndex = 0;
            }){
                Image(systemName: "house.circle.fill")
                    .font(.system(size: 45))
                    .foregroundColor(Color(red: 193/255, green: 146/255, blue: 74/255))
                
            }.padding(.leading, 15)
            //.foregroundColor(Color(red: 33/255, green: 44/255, blue: 95/255).opacity(self.index == 0 ? 1 : 0.1))
            
            Spacer(minLength: 0)
            
            Button(action: {
               return self.pageIndex = 1;
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
               return self.pageIndex = 2;
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
        
    }

}

struct BottomNav_Previews: PreviewProvider {
   
    static var previews: some View {
        BottomNav()
    }
}
