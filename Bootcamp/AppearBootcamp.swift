//
//  AppearBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 21.08.2023.
//

import SwiftUI

struct AppearBootcamp: View {
    @State var text : String = "Start title."
    @State var count : Int = 0
    
    var body: some View {
        NavigationView {
            
            ScrollView{
                LazyVStack {
                    
                    ForEach(0..<50){ _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear{
                              count += 1
                            }
                        
                    }
                }
            }
            
            
            .navigationTitle("Count : \(count)")
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                text = "This is the new text"
            }
        }
        .onDisappear{
         
                text = "End title"    //görünüm ekrandan ayrıldığında çalışır
            
        }
    }
}

struct AppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppearBootcamp()
    }
}
