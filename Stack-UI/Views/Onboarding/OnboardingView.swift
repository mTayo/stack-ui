//
//  OnboardingView.swift
//  Stack-UI
//
//  Created by Adinlewa Olutayo on 22/06/2024.
//
//
import Foundation
import SwiftUI

var totalViews = 2
struct OnboardingView: View{
    var data: [OnboardingData] = onboardingData
    @State var currentView: Int = 0
    
    func updateCurrentView(viewNumber: Int) {
        currentView = viewNumber
    }
    
    var body: some View{
        if currentView == 0 {
            OnboardingScreen(data: data[0], currentView: currentView, updateCurrentView:updateCurrentView)
        }else if currentView == 1 {
            OnboardingScreen(data: data[1], currentView: currentView, updateCurrentView:updateCurrentView)
        }else{
            OnboardingScreen(data: data[2], currentView: currentView,updateCurrentView:updateCurrentView)
        }
        
    }
}

struct OnboardingScreen: View {
    
    var data: OnboardingData
    var currentView: Int
    var updateCurrentView: (Int) -> ()
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Stack.io")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Spacer()
                    Button(
                        action: {
                            updateCurrentView(2)
                        },
                        label: {
                            Text("Skip")
                                .foregroundColor(Color.appDarkPink)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                        }
                    )
                }
                
                VStack(alignment: .center){
                    Image(data.img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .scaleEffect(isAnimating ? 1.0 : 0.6)
                        .frame(width: 400.0, height: 400.0)
                }.animation(Animation.easeOut(duration: 20.0), value: 200.0)
             
                VStack(alignment: .center){
                    Text(data.title)
                        .font(.system(size: 37, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.bottom, 0)
                    Text(data.text)
                        .font(.system(size: 18, design: .rounded))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 7, leading:0, bottom: 0, trailing: 0))
                }.animation(Animation.easeOut(duration: 20.0), value: 200.0)
                
            }
            Spacer()
            VStack{
                HStack{
                    renderSteps()
                    Spacer()
                    Button(
                        action:{
                            withAnimation(.easeOut) {
                                if currentView < totalViews  {
                                    updateCurrentView(currentView+1)
                                } else if currentView == 2 {
                                    updateCurrentView(0)
                                }
                            }
                        },
                        label: {
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.white)
                                .font(.system(size: 35.0, weight: .semibold))
                                .frame(width: 70, height: 70)
                                .background(Color.appDarkPink)
                                .clipShape(Circle())
                                .padding(17)
                                .overlay(
                                    ZStack{
                                        Circle()
                                            .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                            .padding()
                                            .foregroundColor(Color.appDarkPink)
                                    }
                                )
                        }
                    )
                }
               
            }
            
        }.safeAreaPadding(.horizontal, 14)
            .background(Color.offWhite)
    }
    
    func renderSteps() -> some View {
        ForEach((0...2), id: \.self)  { index in
                ContainerRelativeShape()
                    .foregroundColor(currentView == index ? Color.appDarkPink : Color.greyColor)
                    .frame(width: 25, height: 7)
                    .clipShape(Capsule())

        }
    }

}

#Preview {
    ContentView()
}

