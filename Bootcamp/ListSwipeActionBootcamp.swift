//
//  ListSwipeActionBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 24.08.2023.
//

import SwiftUI

struct ListSwipeActionBootcamp: View {
    
    @State var fruit : [String] = ["apple" , "orange" ,"banana"]
    var body: some View {
        
        List{
            ForEach(fruit,id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge:.trailing, allowsFullSwipe : false) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        Button("Like") {
                            
                        }
                        .tint(.pink)

                    }
                    .swipeActions(edge:.leading, allowsFullSwipe : true) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
            }
        }
    }
}

struct ListSwipeActionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionBootcamp()
    }
}
