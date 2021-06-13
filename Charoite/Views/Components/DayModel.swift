//
//  DayModel.swift
//  Charoite
//
//  Created by  Apple on 13.06.2021.
//

import Foundation
struct DayModel: Identifiable {
    let id: String =  UUID().uuidString
    let date: Date
    let emotion: Int
    let story: String
    //let music: [AnyObject]
    let quote: String
    //let photos: [AnyObject]
    
    
}
