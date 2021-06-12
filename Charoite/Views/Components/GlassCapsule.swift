//
//  GlassCapsule.swift
//  Charoite
//
//  Created by Горячев Александр on 12.06.2021.
//

import SwiftUI

struct GlassCapsule: View {
    var body: some View {
        
        Capsule()
            
            .frame(width: 239, height: 61)
            .foregroundColor(.alphaWhite)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.alphaWhite2, lineWidth: 1)
            )
            .shadow(color: .shadowBlack2, radius: 50, x: 10, y: 10)
            //.background(.thinMaterial)
        
    }
}

struct GlassCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GlassCapsule()
            
    }
}
