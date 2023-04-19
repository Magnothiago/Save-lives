//
//  HomeView.swift
//  Restart
//
//  Created by Thiago Magno Furtado on 28/03/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20){
            // MARK: - Header
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2").resizable().scaledToFit().padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(Animation.easeOut(duration: 4).repeatForever(), value: isAnimating)
            }
            
            // MARK: - CENTER
            Text("The time the leads to mastery is dependent on the intensity of our focus").font(.title3).fontWeight(.light).foregroundColor(.secondary).multilineTextAlignment(.center).padding()
            
            // MARK: - FOOTER
            Spacer()
            
            Button(action: {
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }){
                
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                Text("Restart")
            }// : button
            .buttonStyle(.borderedProminent).buttonBorderShape(.capsule).controlSize(.large)
        }//: ZSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
