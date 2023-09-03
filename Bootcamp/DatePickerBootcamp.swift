//
//  DatePickerBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 19.08.2023.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var date = Date()
    let startingDate : Date = Calendar.current.date(from: DateComponents(year: 2020)) ?? Date()
    let endingDate : Date = Date()
    
    var dateFormatter : DateFormatter {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter
    }
    
    
    var body: some View {
       
        VStack {
            
            Text("Selected Date is: ")
            Text(dateFormatter.string(from: date))
                .font(.title)
            // DatePicker("Select a Date", selection: $date)
            
            //DatePicker("Select a Date", selection: $date , displayedComponents: [.date , .hourAndMinute])  //özelleştime
            DatePicker("Select a Date", selection: $date, in: startingDate...endingDate , displayedComponents: [.date])
            
                .accentColor(.red)
                .datePickerStyle(CompactDatePickerStyle())
                .padding()
            
        }
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
