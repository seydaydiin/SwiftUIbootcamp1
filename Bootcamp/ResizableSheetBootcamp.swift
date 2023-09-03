//
//  ResizableSheetBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 25.08.2023.
//

import SwiftUI

struct ResizableSheetBootcamp: View {
    
    @State private var showSheet : Bool = false
    @State private var detents : PresentationDetent = .large
    var body: some View {
        Button("Click Me") {
            showSheet.toggle()
            
        }
        .sheet(isPresented: $showSheet) {
            MySheetView(detents: $detents)
                //.presentationDetents([.large,.medium])
                .presentationDragIndicator(.hidden)
                //.presentationDetents([.fraction(0.1),.medium,.large])
                //.presentationDetents([.fraction(0.1),.height(300),.medium,.large])
                .presentationDetents([.medium,.large], selection: $detents)
                .presentationDragIndicator(.visible)

                //.interactiveDismissDisabled()
        }
        .onAppear{
            showSheet = true
        }
    }
}
struct MySheetView : View {
    @Binding var detents : PresentationDetent
    
    var body: some View {
        
        ZStack{
            Color.pink.ignoresSafeArea()
            VStack(spacing: 40) {
                Button("Medium") {
                    detents = .medium
                }
                Button("Large") {
                    detents = .large
                }
               
            }
            .font(.headline)
            .foregroundColor(.white)
        }
    }
}
struct ResizableSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetBootcamp()
    }
}
