//
//  GlassSquare.swift
//  Charoite
//
//  Created by  Apple on 13.06.2021.
//

import SwiftUI

struct GlassSquare: View {
    var body: some View {
        RoundedRectangle (cornerRadius: 21)
            .frame(width: 150, height: 150)
            .foregroundColor(.alphaWhite)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .stroke(Color.alphaWhite2, lineWidth: 1)
            )
            .shadow(color: .shadowBlack2, radius: 50, x: 10, y: 10)
            //.background(.thinMaterial)
    }
}

struct GlassSquare_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            
            GlassSquare()
        }
    }
}
