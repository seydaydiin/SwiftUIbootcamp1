//
//  AsyncImageBootcamp.swift
//  Bootcamp
//
//  Created by Şeyda Aydın on 24.08.2023.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        
        
        AsyncImage(url: url) { phase in
            
            switch phase {
            case .empty :
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
            case .failure(let error) :
                Text(error.localizedDescription)
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
        /*
      
        AsyncImage(url: url) { image in
            
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            
        } placeholder: {
            ProgressView()
        }
        
*/
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
