//
//  BackgroundMaterialBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 24.08.2023.
//

import SwiftUI

struct BackgroundMaterialBootcamp: View {
    var body: some View {
    
        VStack{
            
            Spacer()
            VStack {
           RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                
                Spacer()
                
               
            }
                .frame(height: 350)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .cornerRadius(40)
                
        }
        .ignoresSafeArea()
        .background(
        Image("ask")
            .resizable()
            .scaledToFill()
        )
    }
}

struct BackgroundMaterialBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialBootcamp()
    }
}
