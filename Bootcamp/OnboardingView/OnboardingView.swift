//
//  OnboardingView.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 22.08.2023.
//

import SwiftUI


struct OnboardingView: View {
    //Onboarding States :
     /*
      1.Welcome Screen
      2.Add name
      3.Add age
      4.Add gender
      */
    
    @State var onBoardingState : Int = 0
    
    //value
    @State var name : String = ""
    @State var age : Double = 20.0
    @State var gender : String = ""
    
    //alert
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    //appStorage
    
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Int?
    @AppStorage("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    let transition : AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    var body: some View {
        
        ZStack {
            
            //content
            
            ZStack{
                
                switch onBoardingState {
                    
                case 0 :
                    WelcomeSection
                        .transition(transition)
                case 1 :
                    addNameSection
                        .transition(transition)
                case 2 :
                    addAgeSection
                        .transition(transition)
                case 3 :
                    selectGenderSection
                        .transition(transition)
                default :
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            }
            .alert(isPresented: $showAlert) {
                return Alert(title: Text(alertTitle))
            }
            
            
            
            //button
            
            
            
            VStack{
                
                Spacer()
                bottomButton
           
            }
            .padding(30)
     
        }
     
    }

}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(Color.purple)
    }
}
//MARK: COMPONENTS
extension OnboardingView {
    private var bottomButton : some View {
        Text(onBoardingState == 0 ? "SIGN UP" :
                onBoardingState == 3 ? "FINISH" :
                "NEXT")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var WelcomeSection : some View {
        
        
        VStack(spacing: 40) {
            Spacer()
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 250,height: 250)
                .foregroundColor(.white)
            
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y:5)
                        .foregroundColor(.white)
                    ,alignment: .bottom
                )
            Text ("This is #1 app find your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques. ")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
                
        }
        .multilineTextAlignment(.center)
        .padding(30)
        
      
    }
    
    private var addNameSection : some View {
        
        
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your name ?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
       
            Spacer()
            Spacer()
                
        }
        .padding(30)
        
      
    }
    
    private var addAgeSection : some View {
        
        
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your age ?").font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Slider(
                   value: $age,
                   in: 18...100,
                   step: 1 )
            .accentColor(Color.white)
       
            Spacer()
            Spacer()
                
        }
        .multilineTextAlignment(.center)
        .padding(30)
        
      
    }
    private var selectGenderSection : some View {
        
        
        VStack(spacing: 20) {
            Spacer()
            
            Text("What's your gender ?").font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            Picker(selection: $gender,
                   label:
                    Text(gender.count > 1 ?  gender : "Select a Gender")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10),
                   content: {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            })
            .pickerStyle(MenuPickerStyle())
            
   
            Spacer()
            Spacer()
                
        }
        .multilineTextAlignment(.center)
        .padding(30)
        
      
    }
  
    
}

//MARK: FUNCTIONS
extension OnboardingView {
    

    
    func handleNextButtonPressed () {
        
        //CHECK INPUTS
        
        switch onBoardingState {
            
        case 1 :
            guard name.count >= 3 else {
                
                return showAlert(title: "Your name must be at least 3 characters long! ")
            }
        case 3 :
            guard gender.count > 1 else {
                return showAlert(title: "Please select a gender before moving forward!")
            }
        default : break
        }
        
        // GO TO NEXT SECTİON
        if onBoardingState == 3 {
            signIn()
            
        }
        else{
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
        
    }
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
        
    }
    
    func showAlert(title : String ) {
        
        alertTitle = title
        showAlert.toggle()
    }

}
