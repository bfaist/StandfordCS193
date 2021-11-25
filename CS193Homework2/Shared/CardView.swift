//
//  CardView.swift
//  CS193Homework2
//
//  Created by Robert Faist on 11/23/21.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let rect = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                rect.fill(.white)
                rect.strokeBorder(.red, lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                rect.fill(.red)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "🐢")
    }
}
