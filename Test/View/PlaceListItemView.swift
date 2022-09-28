//
//  PlaceGridItemView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 19/07/2022.
//

import SwiftUI

struct PlaceListItemView: View {
    
    //var place: Place
    var nameTry: String
    var shortDescTry: String
    var image: URL
    //var gallImage: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 16){
            AsyncImage(url: image) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150,height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .multilineTextAlignment(.center)
            
            /*
             .resizable()
             .scaledToFill()
             .frame(width: 150,height: 120)
             .clipShape(RoundedRectangle(cornerRadius: 12))
             .multilineTextAlignment(.center)
             
             */
            
            VStack(alignment: .leading, spacing: 8) {
                Text(nameTry)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                Text(shortDescTry)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                //.lineLimit(4)
                    .padding(.bottom, 15)
                    .frame(maxWidth:250)
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct PlaceGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListItemView(/*place: placeData[0],*/nameTry: "",shortDescTry: "",image: URL(string: "" )!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
