//
//  ModelBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 21.08.2023.
//

import SwiftUI

struct userModel : Identifiable
{
    let id  : String = UUID().uuidString
    let displayName : String
    let userName : String
    let followerCount : Int
    let isVerified : Bool
    
}

struct ModelBootcamp: View {
    
    @State var users : [userModel] = [
    
        //"Nick","Bella","Cris","Arthur","Emily"
        
        userModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        userModel(displayName: "Cris", userName: "cris45", followerCount: 200, isVerified: false),
        userModel(displayName: "Emily", userName: "emily789", followerCount: 90, isVerified: true),
        userModel(displayName: "Arthur", userName: "arthur49", followerCount: 1000, isVerified: false)
        
    
    ]
    
    var body: some View {
       
        NavigationView {
            
            List {
                
                ForEach(users) { user in
                    
                    HStack(spacing : 20) {
                        
                        Circle()
                            .frame(width: 30 ,height: 30)
                       
                        VStack(alignment: .leading){
                            
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    
                }
                .padding(.vertical ,10)
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Users")
        }
    }
}

struct ModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ModelBootcamp()
    }
}
