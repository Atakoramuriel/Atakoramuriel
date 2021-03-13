//
//  profileImgCircle.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/14/21.
//

import SwiftUI

struct profileImgCircle: View {
    var body: some View {
        Image("RuiLogo") //to be replaced with profile image
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(radius: 10)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)    }
}

struct profileImgCircle_Previews: PreviewProvider {
    static var previews: some View {
        profileImgCircle()
    }
}
