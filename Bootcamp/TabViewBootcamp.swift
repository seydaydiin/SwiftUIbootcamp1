//
//  TabViewBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 21.08.2023.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    let icons : [String] = [
    "heart.fill" , "globe" , "person.fill" , "house.fill"
    
    ]
    
    var body: some View{
        
        TabView {
            
            ForEach(icons ,id: \.self) { icon in
                
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(40)
                
            }
           
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.pink,Color.gray]), center: .center, startRadius: 5, endRadius: 300))
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
        
        
        
        
        
        
        
        
        
    }
    /*
    @State var selectedTab :Int = 0
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            HomeView(selectedTab: $selectedTab)
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            BrowseView(selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "globe")
                            Text("Browse")
                        }
                        .tag(1)
            
            ProfileView(selectedTab: $selectedTab)
                .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                .tag(2)
        }
        
        
    }
     */
}
struct HomeView: View {
    
    @Binding var selectedTab : Int
    var body : some View {
   
        ZStack{
            Color.pink.edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to Profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(Color.pink)
                        .cornerRadius(10)
                }

                
            }
        }
    }
}

struct ProfileView: View {
    
    @Binding var selectedTab : Int
    var body : some View {
   
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Profile Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
             
                
                Button {
                    selectedTab = 1
                } label: {
                    Text("Go to Browse")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(Color.blue)
                        .cornerRadius(10)
                }

                
            }
        }
    }
}

struct BrowseView: View {
    
    @Binding var selectedTab : Int
    var body : some View {
   
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Browse Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                
                Button {
                    selectedTab = 0
                } label: {
                    Text("Go to Home")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(Color.yellow)
                        .cornerRadius(10)
                }

                
            }
        }
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}
