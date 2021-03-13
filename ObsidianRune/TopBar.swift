//
//  TopBar.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/16/21.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        VStack(spacing: 20){
            HStack{
               titleBanner()
                Spacer()
                Button(action: {
                    
                }){
                    Image(systemName: "moon").font(.system(size: 40)).foregroundColor(.white)
                }
            }
        }.padding()
        .padding(.top, 35)
        .background(Color.black)
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
