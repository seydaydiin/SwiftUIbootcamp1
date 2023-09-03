//
//  ProfilView.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 24.08.2023.
//

import SwiftUI

struct ProfilView: View {
  
    
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Int?
    @AppStorage("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currentUserSignedIn : Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUserName ?? "Your name here")
            Text("This user is \(currentUserAge ?? 0) years old")
            Text("This gender is \(currentUserGender ?? "unknown") ")
            
            Text("SIGN OUT")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title)
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical,40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}




struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
