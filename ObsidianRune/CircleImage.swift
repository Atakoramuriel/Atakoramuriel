//
//  CircleImage.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/13/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("RuiLogo")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(radius: 10)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
