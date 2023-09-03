//
//  FocusStateBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 24.08.2023.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    enum TextFieldFocus  : Hashable {
        case usernameIsFocus
        case passwordIsFocus
    }
    
    @State var name : String = ""
    @State var password : String = ""
    @FocusState var textFieldFocus : TextFieldFocus?
    
    var body: some View {
    
        VStack(spacing: 20) {
            TextField("name", text: $name)
                .font(.headline)
                .focused($textFieldFocus,equals: .usernameIsFocus)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.leading)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
                
            
            SecureField("password", text: $password)
                .font(.headline)
                .focused($textFieldFocus,equals: .passwordIsFocus)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.leading)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("Sign In") {
                let userNameIsValid = !name.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if userNameIsValid && passwordIsValid {
                  
                    print("SIGN IN")
                }
                else if userNameIsValid {
                    textFieldFocus = .passwordIsFocus
                }
                else {
                    textFieldFocus = .usernameIsFocus
                }
            }
            
        }
        .padding(40)
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
