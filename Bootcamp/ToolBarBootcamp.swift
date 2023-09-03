//
//  ToolBarBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 25.08.2023.
//

import SwiftUI

struct ToolBarBootcamp: View {
    
    @State var text : String = ""
    @State var path : [String] = []
    var body: some View {
        NavigationStack (path: $path){
            
            ScrollView {
                
                TextField("Placeholder", text: $text)
                
                ForEach(0..<100) { _ in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.indigo)
                        .frame(width:200,height: 200)
                    
                }
            }
            .navigationTitle("ToolBar")
            /*
            .navigationBarItems(
                leading: Image(systemName: "heart.fill"),
                trailing: Image(systemName: "gear")
                              )
             */
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
                          
            }
            //.navigationBarHidden(true)
            //.toolbar(.hidden,for: .navigationBar)
            //.toolbarBackground(.hidden, for: .navigationBar)
            //.toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Screen 1") {
                    path.append("1")
                    
                }
                Button("Screen 2") {
                    path.append("2")
                    
                }
            }
            .navigationDestination(for:String.self) { value in
                MySecondVieww(value : value)
        }
    
        }
    }
}
struct MySecondVieww : View {
    
    let value : String
    
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            
            Text("New Screen : \(value)")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}
struct ToolBarBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarBootcamp()
    }
}
