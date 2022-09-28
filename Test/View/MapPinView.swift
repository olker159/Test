//
//  MapPinView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 21/07/2022.
//

import SwiftUI

struct MapPinView: View {
    
    var location: Locations
    
    var body: some View {
        Image(location.image)
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    }
}

struct MapPinView_Previews: PreviewProvider {
    static var previews: some View {
        MapPinView(location: locationsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
