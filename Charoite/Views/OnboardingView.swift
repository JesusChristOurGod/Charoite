//
//  OnboardingView.swift
//  Charoite
//
//  Created by Горячев Александр on 12.06.2021.
//

import SwiftUI

struct OnboardingView: View {
    @State var isAnimated: Bool = false
    let greetingArray: [String] = ["I hope that your day was wonderful", "I am greeting you, as always", "What are the news?", "Please, write something today", "Had a nice day, didn't ya?"]
    @State var buttonText: String = "Enter"
    var body: some View {
        NavigationView{
            ZStack{
                Image("Fon").edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Spacer()
                    VStack(spacing:203){
                        greetingLabel
                        goButton
                    }
                    Spacer()
                }
                capsuleAnimation
                
                
            }
        }.onAppear(perform:animate)
        
    }
}
//MARK: VIEWS
extension OnboardingView {
    private var capsuleAnimation: some View{
        HStack(spacing:-15){
            Capsule().foregroundColor(.mint).shadow(color: .shadowBlack, radius: 6, x: 1, y: 3).offset(y: isAnimated ?  -500: 0)
            Capsule().foregroundColor(.pinky).shadow(color: .shadowBlack, radius: 6, x: 1, y: 3).offset(y: isAnimated ? -550: 0)
            Capsule().foregroundColor(.yellowy).shadow(color: .shadowBlack, radius: 6, x: 1, y: 3).offset(y: isAnimated ? -700: 0)
            Capsule().foregroundColor(.pinky).shadow(color: .shadowBlack, radius: 6, x: 1, y: 3).offset(y: isAnimated ? -670: 0)
            Capsule().foregroundColor(.reddish).shadow(color: .shadowBlack, radius: 6, x: 1, y: 3).offset(y: isAnimated ? -660: 0)
            Capsule().foregroundColor(.mint).shadow(color: .shadowBlack, radius: 6, x: 1, y: 3).offset(y: isAnimated ? -640: 0)
            Capsule().foregroundColor(.pinky).shadow(color: .shadowBlack, radius: 6, x: 1, y: 3).offset(y: isAnimated ?  -530: 0)
        }.offset(y: -70)
    }
    
    private var greetingLabel: some View{
        VStack(spacing:45){
            Text("Welcome to your diary, Alexander!")
                .frame(width: 336)
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .semibold, design: .rounded))
                //.fontWeight(.semibold)
                
                .multilineTextAlignment(.center)
            
            Text("\(pickGreeting())")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .medium, design: .rounded))
        }
    }
    private var goButton: some View{
        ZStack{
            GlassCapsule()
            HStack(spacing:31){
                Text("\(buttonText)")
                    .foregroundColor(.white)
                    .font(.system(size: 35, weight: .semibold, design: .rounded))
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
        }
    }
}
//MARK: FUNCTIONS
extension OnboardingView{
    func animate () {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.default) {
                isAnimated.toggle()
            }
        }
    }
    func pickGreeting() -> String {
        let r = Int.random(in: 0...greetingArray.count)
        return greetingArray[r]
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
