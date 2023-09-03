//
//  NavigationStackBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 25.08.2023.
//

import SwiftUI
struct NavigationStackBootcamp: View {
    let fruits : [String] = [
    "orange" , "apple" , "banana"
    ]
    @State private var path : [String] = []

    var body: some View {
     
        NavigationStack(path: $path){
            
            ScrollView{
                VStack(spacing: 40) {
                    
                    Button("Super Segue ") {
                        path.append(contentsOf: ["Coconut","Watermelon"])
                    }
                    ForEach(fruits, id : \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                    ForEach(0..<10) { value in
                        
                        NavigationLink(value: value) {
                            Text("Click Me : \(value)")
                        }
                        
                    }
                }
            }
          
            .navigationTitle("Navigation Stack")
            .navigationDestination(for: String.self ) { fruit in
                Text("Another View: \(fruit)")
            }
            .navigationDestination(for: Int.self){ value in
                MySecondView(value: value)
            }
        }
       
    }
}
struct MySecondView : View {
    let value : Int
    
    init(value: Int) {
        self.value = value
        print("init screen : \(value)")
    }
    var body: some View {
        
        Text(" View : \(value) ")
    }
}

struct NavigationStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootcamp()
    }
}
