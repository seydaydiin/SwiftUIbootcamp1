//
//  TextEditorBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 18.08.2023.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditor : String = "Hello"
    @State var savedText : String = ""
    var body: some View {
        
        NavigationView{
            VStack {
                
                TextEditor(text: $textEditor)
                    .frame(height: 250)
                    .colorMultiply(Color.gray)
                    .cornerRadius(10)
                
                Button(action: {
                    
                    savedText = textEditor
                        
                    
                }, label: {
                    
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                })
                Text(savedText)
                
                Spacer()
                
            }
            .padding()
            .background(Color.white)
            .navigationTitle("TextEditor Bootcamp!")
            
        }
    }
    
}
    struct TextEditorBootcamp_Previews: PreviewProvider {
        static var previews: some View {
            TextEditorBootcamp()
        }
    }

