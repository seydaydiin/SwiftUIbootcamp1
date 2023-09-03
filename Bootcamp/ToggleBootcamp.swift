//
//  ToggleBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 18.08.2023.
//

import SwiftUI

struct ToggleBootcamp: View {
    @State var toggleIsOn : Bool = false
    var body: some View {
       
        VStack {
            HStack{
                Text("Status")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            
            Toggle("Change Status", isOn: $toggleIsOn)
                .toggleStyle(SwitchToggleStyle(tint: .pink))
              
            
            Spacer()
        }
        .padding(.horizontal,100)
        
       
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
