//
//  HeadingView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 21/07/2022.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack{
        Image(systemName: headingImage)
                .foregroundColor(.white)
                .imageScale(.large)
            
        Text(headingText)
            //.underline()
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top,1)
        }
        
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "info.circle.fill", headingText: "More info")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
