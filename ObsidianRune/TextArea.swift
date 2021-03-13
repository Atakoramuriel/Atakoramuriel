//
//  TextArea.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/14/21.
//

import SwiftUI

struct TextArea: View {
    @State private var textInput = "SampleText";
    @State private var displayText = "";
    
    var body: some View {
        
        //Creation of TextField
        TextField("Testing", text: $textInput)

            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea()
    }
}
