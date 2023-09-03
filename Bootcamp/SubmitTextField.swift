//
//  SubmitTextField.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 25.08.2023.
//

import SwiftUI

struct SubmitTextField: View {
    
    @State var text : String = ""
    
    @State var text1 : String = ""
    
    @State var text2 : String = ""
    
    var body: some View {
        
        
        VStack {
            TextField("Placeholder", text: $text)
                .submitLabel(.go)
                .onSubmit {
                    print("hello")
                }
            TextField("Placeholder", text: $text1)
                .submitLabel(.next)
                .onSubmit {
                    print("hello")
                }
            TextField("Placeholder", text: $text2)
                .submitLabel(.search)
                .onSubmit {
                    print("hello")
                }
        }
    }
}

struct SubmitTextField_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextField()
    }
}
