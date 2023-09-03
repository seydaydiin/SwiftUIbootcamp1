//
//  BadgesBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 24.08.2023.
//

import SwiftUI

//TabView
//List

struct BadgesBootcamp: View {
    var body: some View {
        
        
        List {
            Text("Hello World")
                .badge("New Item")
                //.badge(5)
        }
        /*
        
        TabView{
            
            Color.red
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Like")
                
                }
                .badge(10)
            Color.green
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Settings")
                    
                }
        }
         */
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}
