//
//  LocationsView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 18/07/2022.
//


import SwiftUI
import MapKit

struct PlaceDetailView: View {

    var image: URL
    var name: String
    var shortDesc: String
    var descr: String
    var factsTry: [String]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                AsyncImage(url: image) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .multilineTextAlignment(.center)
                
                
                Text(name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                
                Group{
                    HeadingView(headingImage: "info.circle.fill", headingText: "Short Description")
                
                    Text(shortDesc)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.top,3)
                    Divider()
                        .padding()
                    }
                Group{
                    HeadingView(headingImage: "info.circle.fill", headingText: "Long Description")
                    
                    Text(descr)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding(.top,3)
                        
                    Divider()
                        .padding()
                }
                
                Group{
                    HeadingView(headingImage: "books.vertical.fill", headingText: "Interesting facts")
                    
                    FactsView(factsTry: factsTry)
                    
                }
                
                
                
                    
            }
        }
    }
    
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(image: URL(string: "")!, name: "", shortDesc: "", descr: "", factsTry: [""])
    }
}

