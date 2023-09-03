//
//  IntroView.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 22.08.2023.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    var body: some View {
       
        ZStack{
            
            RadialGradient(
                gradient: Gradient(colors: [Color.purple ,Color.blue]),
                center: .topLeading,
                startRadius: 280,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if currentUserSignedIn {
               ProfilView()
                    .transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom), removal: AnyTransition.move(edge: .top)))
            }
            else {
                OnboardingView()
                    .transition(.asymmetric(insertion: AnyTransition.move(edge: .top), removal: AnyTransition.move(edge: .bottom)))
            }
            
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
