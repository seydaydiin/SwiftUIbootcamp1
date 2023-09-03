//
//  DocumentationBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 21.08.2023.
//

import SwiftUI

struct DocumentationBootcamp: View {
    //MARK: PROPERTIES
    
    @State var showAlert : Bool = false
    
    let values : [String] = [
   "apple","banana","orange"]
    
    //MARK: BODY
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                // background
                
                Color.pink.ignoresSafeArea()
                
                // foreground
         
                foreground
                
                .font(.headline)
                .navigationTitle("Documentation")
                .navigationBarItems(trailing: Button("Alert",
                                                     action: {
                                    showAlert.toggle()
                }))
                .alert(isPresented: $showAlert) {
                getAlert(title: "This is an alert.")
            }
            }
            
        }//Nav
       
    }
    
    ///This is the foreground layer that holds a scrollView
    private var foreground : some View {
        ScrollView{
            
            Text("Hello")
            
            ForEach(values,id: \.self) { value in
                
                Text(value)
                    
            }
            
        }//Scroll
        
    }
    //MARK: FUNCTIONS
    
    /// Gets an alert with a specified title  //summary
    ///
    ///This function creates and returns an alert     //discussion
    /// ```
    ///getAlert( title : "Hi" ) -> Alert (title: Text("Hi"))
    /// ```
    ///
    /// - Warning: This is no additional message in this Alert.
    /// - Parameter title: This is the title for the alert
    /// - Returns: Returns  an alert with a title
    func getAlert( title : String ) -> Alert {
        return Alert(title: Text(title))
        
    }
      
}

//MARK: PREWIEWS


struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
