//
//  StepperBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 21.08.2023.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue : Int = 10
    @State var incrementStepper: CGFloat = 0
    
    var body: some View {
    
        VStack {
            
            Stepper("Stepper : \(stepperValue)", value: $stepperValue )
                .padding()
            
            Stepper("Stepper 2")
            {
                incrementStepper(amount: 20)
                
            } onDecrement : {
                
                incrementStepper(amount: -20)
            }
            .padding()
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100 + incrementStepper, height: 100)
            
        }
       
    }
    func incrementStepper(amount : CGFloat) {
        withAnimation(.easeInOut) {
            incrementStepper += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
