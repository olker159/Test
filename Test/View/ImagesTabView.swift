//
//  ImagesTabView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 18/07/2022.
//

import SwiftUI

struct ImagesTabView: View {
    
    var coverImage: [CoverImage] = coverImageData
    
    var body: some View {
        TabView{
            ForEach(coverImage) { image in
                
                Image(image.name)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear{
            setupAppearance()
        }
        
        
    }
}
struct ImagesTabView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesTabView(coverImage: coverImageData)
            .previewLayout(.fixed(width: 400, height: 300))
            .padding()
    }
}
