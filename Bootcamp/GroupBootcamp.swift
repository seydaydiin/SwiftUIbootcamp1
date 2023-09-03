//
//  GroupBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 27.08.2023.
//

import SwiftUI

struct GroupBootcamp: View {
    var body: some View {
     
        VStack(spacing: 30){
            
            Text("Hello")
            
            Group {
                Text("Hello")
                
                Text("Hello")
            }
            .font(.headline)
            .foregroundColor(.red)
        }
        .foregroundColor(.green)
        .font(.title)
      
    }
}

struct GroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GroupBootcamp()
    }
}
