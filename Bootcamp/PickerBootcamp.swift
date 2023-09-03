//
//  PickerBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 19.08.2023.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection : String = "Most Recent"
    let filterOptions : [String] = ["Most Recent", "Most Popular","Most Liked"]
   
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        let attributes : [NSAttributedString.Key : Any] = [ .foregroundColor : UIColor.white]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    
    var body: some View {
        
        
        Picker(
            selection: $selection,
            label: Text("Picker"),
            content: {
            ForEach(filterOptions.indices) { index in
                Text(filterOptions[index])
                    .tag(filterOptions[index])
                
            }
        
        })
        .pickerStyle(SegmentedPickerStyle())
        
         
        /*
     
            Picker(
                selection: $selection,
                label:
                    HStack{
                        Text("Filter :")
                        Text(selection)
                        
                    }
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.pink.opacity(0.3), radius: 10 , x:0 ,y:10)
                
                
                ,
                
                content: {
                    ForEach(filterOptions , id: \.self) { option in
                        
                        HStack{
                            Text(option)
                            Image(systemName: "heart.fill")
                            
                        }
                        .tag(option)
                    }
                })
            .pickerStyle(MenuPickerStyle())
            
        
        */
    
        /*
        VStack{
            
            HStack{
                Text("Age : ")
                Text(selection)
            }
            
            Picker(
                selection: $selection,
                label: Text("picker"),
                content:
                    {
                        ForEach(18..<100) { number in
                            Text("\(number)")
                                .tag("\(number)")
                            
                        }
                    })
            .pickerStyle(WheelPickerStyle())
        }
         */
         
    }
       
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
