//
//  IfLetGuardBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 21.08.2023.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
    
    @State var currentUser : String? = "testUser"
    @State var displayText : String? = ""
    @State var isLoading : Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                Text("Here we are practicing safe coding")
                
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            
            
            .navigationTitle("Safe Coding")
            .onAppear{
                loadData2()
            }
        }
    }
    
    func loadData() {
        if let userID = currentUser {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = " This is new data ! : \(userID)"
                isLoading = false
            }
        }
        else {
            displayText = "Error. There is not current user."
        }
        
    }
    
    func loadData2() {
        guard let userID = currentUser else{
            
            displayText = "Error. There is not current user."
            return
            
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = " This is new data ! : \(userID)"
            isLoading = false
            
            
        }
    }
}
struct IfLetGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootcamp()
    }
}
