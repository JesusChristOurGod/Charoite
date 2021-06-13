//
//  DayViewModel.swift
//  Charoite
//
//  Created by  Apple on 13.06.2021.
//

import Foundation
public class DayViewModel: ObservableObject{
    @Published var days: [DayModel] = []
    
    
    func addNewDay (date: Date, emotion: Int, story: String, quote: String){
        let newDay = DayModel (date: date, emotion: emotion, story: story, quote: quote)
        days.append(newDay)
    }
}
