//
//  titleBanner.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/16/21.
//

import SwiftUI

struct titleBanner: View {
    
    
    //For getting the Height/width of the screen
    @State private var screenHeight = UIScreen.main.bounds.height;
    @State private var screenWidth = UIScreen.main.bounds.width;
    
    var body: some View {
        Image("TitleBanner")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: screenWidth * 0.55, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct titleBanner_Previews: PreviewProvider {
    static var previews: some View {
        titleBanner()
    }
}
