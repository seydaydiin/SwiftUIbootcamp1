//
//  TapGestureBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 21.08.2023.
//

import SwiftUI

struct TapGestureBootcamp: View {
    @State var isSelected : Bool = false
    var body: some View {
       
        VStack(spacing: 20){
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 300)
                .foregroundColor(isSelected ? Color.green : Color.red)
            
            Text("Tap Gestured")
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(25)
                .onTapGesture (count: 2, perform: {
                    isSelected.toggle()
                })
                
            
            Spacer()
            
                
        }
        .padding()
    }
}

struct TapGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureBootcamp()
    }
}
