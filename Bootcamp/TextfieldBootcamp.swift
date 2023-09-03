//
//  TextfieldBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 17.08.2023.
//

import SwiftUI

struct TextfieldBootcamp: View {
    
    @State var textfield : String = ""
    @State var dataArray : [String] = []
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textfield)
                // .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button (action : {
                    
                    if textIsAppropriate() {
                        
                        save()
                    }
                  
                    
                } , label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.pink : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    
                })
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { data in
                    
                    Text(data)
                    
                }
                
                Spacer()
                
                    
            }
            .padding()
            .navigationTitle("Textfield Bootcamp!")
            
        }
            
        }
    
    func textIsAppropriate() -> Bool {
        if textfield.count >= 3 {
            return true
        }
        return false
    }
    
    func save() {
        dataArray.append(textfield)
        textfield = ""
        
    }
    
}
    struct TextfieldBootcamp_Previews: PreviewProvider {
        static var previews: some View {
            TextfieldBootcamp()
        }
    }

