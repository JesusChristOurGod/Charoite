//
//  TabBarView.swift
//  Charoite
//
//  Created by  Apple on 13.06.2021.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var dayViewModel: DayViewModel
    var body: some View {
        VStack{
            Text("\(dayViewModel.days[0].date)")
            Text("\(dayViewModel.days[0].emotion)")
            Text("\(dayViewModel.days[0].story)")
            Text("\(dayViewModel.days[0].quote)")
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
