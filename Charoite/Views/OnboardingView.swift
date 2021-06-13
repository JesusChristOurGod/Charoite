//
//  OnboardingView.swift
//  Charoite
//
//  Created by Горячев Александр on 12.06.2021.
//

import SwiftUI

struct OnboardingView: View {
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    @StateObject var dayViewModel = DayViewModel()
    @State var isAnimated: Bool = false
    
    @State var sendEmoji: Int = 0
    @State var sendStory: String = ""
    @State var sendQuote: String = ""
    
    let greetingArray: [String] = ["I hope that your day was wonderful", "I am greeting you, as always", "What are the news?", "Please, write something today", "Had a nice day, didn't ya?"]
    //@State var buttonText: String = "Enter"
    @State var onboardingStage: Int = 0
//    @State var headerText: String = "Tell me how you felt today"
    @State var dayStory: String = ""
    @State var quote: String = ""
    @State var placeHolderOpacity: Int = 0
    var body: some View {
            ZStack{
                Image("Fon").edgesIgnoringSafeArea(.all)
                VStack (spacing:0){
                    header.offset(x:-20)
                        switch onboardingStage{
                        case 0:
                            greetingLabel.frame(height: 616)
                        case 1:
                            emojiGrid.frame(height: 616)
                        case 2:
                            textEdit.frame(height:616)
                        case 3:
                            musicStack.frame(height:616)
                        case 4:
                            quoteEdit.frame(height: 561)
                        case 5:
                            photoStack.frame(height:616)
                        default:
                            TabBarView()
                        }
                    goButton
                }
               
                
               
               
                capsuleAnimation.opacity(onboardingStage == 0 ? 1: 0)
                
                
            }.onAppear(perform:animate)
            .environmentObject(dayViewModel)
    }
}
//MARK: VIEWS STAGE 0
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
                
                
                .multilineTextAlignment(.center)
            
            Text("\(pickGreeting())")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .medium, design: .rounded))
        }
    }
    private var goButton: some View{
        Button(action: addOne ) {
            ZStack{
                if onboardingStage != 6 {
                GlassCapsule()
                switch onboardingStage{
                case 5:
                    Text("\(buttonTextPicker())")
                        .foregroundColor(.white)
                        .font(.system(size: 35, weight: .semibold, design: .rounded))
                default:
                    HStack(spacing:31){
                        Text("\(buttonTextPicker())")
                            .foregroundColor(.white)
                            .font(.system(size: 35, weight: .semibold, design: .rounded))
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                }
                
                
                } else {
                    
                }
            } //.position(x:260, y: 759).frame(width: 250, height: 70)
        }
    }
    
    private var header: some View {
        Text("\(headerPicker())")
            .frame(width: 336)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .font(.system(size: 43, weight: .semibold, design: .rounded))
            //.position(x: 250, y: 60)
            .opacity(onboardingStage == 0 ? 0: 1)
            
    }
}


//MARK: VIEWS STAGE 1
extension OnboardingView {
    private var emojiGrid: some View{
        
            VStack(spacing:25){
                HStack(spacing: 50){
                    
                    Button(action: {self.sendEmoji = 6}){
                    ZStack{
                        GlassSquare()
                        VStack (spacing: -7){
                            Text("😃")
                                .font(.system(size: 100))
                                
                            Text("GREAT")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                    }
                    }
                    
                    Button(action: {self.sendEmoji = 5}){
                    ZStack{
                        GlassSquare()
                        VStack (spacing: -7){
                            Text("🙂")
                                .font(.system(size: 100))
                                
                            Text("HAPPY")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                    }
                    }
                }
                
                
                
                HStack(spacing: 50){
                    
                    Button (action: {self.sendEmoji = 4}){
                    ZStack{
                        GlassSquare()
                        VStack (spacing: -7){
                            Text("😐")
                                .font(.system(size: 100))
                                
                            Text("OK...")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                    }
                    }
                    
                    Button (action: {self.sendEmoji = 3}){
                    ZStack{
                        GlassSquare()
                        VStack (spacing: -7){
                            Text("😔")
                                .font(.system(size: 100))
                                
                            Text("SAD")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                    }
                    }
                }
                
                
                HStack(spacing: 50){
                    Button(action: {self.sendEmoji = 2}){
                    ZStack{
                        GlassSquare()
                        VStack (spacing: -7){
                            Text("😭")
                                .font(.system(size: 100))
                                
                            Text("AWFUL")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                    }
                }
                    Button(action: {self.sendEmoji = 1}){
                    ZStack{
                        GlassSquare()
                        VStack (spacing: -7){
                            Text("🤬")
                                .font(.system(size: 100))
                                
                            Text("ANGRY")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                    }
                    }
                }
            }
        }
    }


//MARK: VIEWS STAGE 2
extension OnboardingView{
    private var textEdit: some View{
        ZStack{
            TextEditor(text: $dayStory).padding()
                .foregroundColor(.textWhite)
                .font(.system(size: 22, weight: .light, design: .rounded))
                .background(Color.alphaWhite)
                .multilineTextAlignment(.leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 34)
                        .stroke(Color.alphaWhite2, lineWidth: 1)
                )
                .frame(width:336, height:463)
                .cornerRadius(34)
                
                .shadow(color: .shadowBlack2, radius: 50, x: 10, y: 10)
                .onTapGesture(perform: {
                    placeHolderOpacity += 1
                })
            
                Text ("Describe what your day was like...")
                    .foregroundColor(.lightGrey)
                    .font(.system(size: 22, weight: .light, design: .rounded))
                    .offset(y: -180)
                    .opacity(placeHolderOpacity>0 ? 0 : 1)
                    .onTapGesture(perform: {
                        placeHolderOpacity += 1
                    })
                    
                            
        }
    }
}
//MARK: VIEWS STAGE 3
extension OnboardingView {
    private var musicStack: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 58)
                    .frame(width: 228, height: 228)
                    .foregroundColor(.alphaWhite)
                    .overlay(
                        RoundedRectangle(cornerRadius: 58)
                            .stroke(Color.alphaWhite2, lineWidth: 1)
                    )
                    .shadow(color: .shadowBlack2, radius: 50, x: 10, y: 10)
                    //.background(.thinMaterial)
                Image(systemName: "music.note")
                    .foregroundColor(.lightGrey)
                    .font(.system(size: 150))
                    
            }
            Text("Connect to AppleMusic")
                .foregroundColor(.lightGrey)
                .font(.system(size: 22, weight: .light, design: .rounded))
        }
    }
}
//MARK: VIEWS STAGE 4
extension OnboardingView{
    private var quoteEdit: some View {
        ZStack{
            TextEditor(text: $quote).padding()
                .foregroundColor(.textWhite)
                .font(.system(size: 22, weight: .light, design: .rounded))
                .background(Color.alphaWhite)
                .multilineTextAlignment(.leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 34)
                        .stroke(Color.alphaWhite2, lineWidth: 1)
                )
                .frame(width:336, height:416)
                .cornerRadius(34)
                
                .shadow(color: .shadowBlack2, radius: 50, x: 10, y: 10)
                .onTapGesture(perform: {
                    placeHolderOpacity += 1
                })
            
                Text ("Type your quote there")
                    .foregroundColor(.lightGrey)
                    .font(.system(size: 22, weight: .light, design: .rounded))
                    .offset(y: -180)
                    .opacity(placeHolderOpacity>0 ? 0 : 1)
                    .onTapGesture(perform: {
                        placeHolderOpacity += 1
                    })
                    
                            
        }
    }
}
//MARK: VIEWS STAGE 5
extension OnboardingView{
    private var photoStack: some View{
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 58)
                    .frame(width: 228, height: 228)
                    .foregroundColor(.alphaWhite)
                    .overlay(
                        RoundedRectangle(cornerRadius: 58)
                            .stroke(Color.alphaWhite2, lineWidth: 1)
                    )
                    .shadow(color: .shadowBlack2, radius: 50, x: 10, y: 10)
                    //.background(.thinMaterial)
                Image(systemName: "camera.fill")
                    .foregroundColor(.lightGrey)
                    .font(.system(size: 150))
                    
            }
            Text("Add photos")
                .foregroundColor(.lightGrey)
                .font(.system(size: 22, weight: .light, design: .rounded))
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
        let r = Int.random(in: 0...greetingArray.count - 1)
        return greetingArray[r]
    }
    func addOne() {
        if onboardingStage == 2 {
            self.sendStory = dayStory
        }
        if onboardingStage == 4 {
            self.sendQuote = quote
        }
        if onboardingStage == 5 {
            dayViewModel.addNewDay(date: Date(), emotion: sendEmoji, story: dayStory, quote: sendQuote)
        }
        self.onboardingStage += 1
        self.placeHolderOpacity = 0
        
    }
    
    func headerPicker() -> String {
        switch onboardingStage {
        case 1:
            return "Tell me how you felt today"
        case 2:
            return "Oh...                What happened?"
            //ADD MORE!!!
        case 3:
            return "What music did you listen to?"
        case 4:
            return "Did you have an interesting thought?"
        case 5:
            return "Add photos of your day to diary"
        default:
            return ""
        }
    }
    func buttonTextPicker() -> String{
        switch onboardingStage {
        case 0:
            return "Enter"
        case 1:
            return "Next"
        case 2:
            return "Next"
            
        case 3:
            return "Skip"
        case 4:
            return "Skip"  //ADD MORE
        case 5:
            return "Finish"
        default:
            return ""
        }
    }
    
    
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
