//
//  GalleryView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 18/07/2022.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 1.0
    /*let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]*/
    
    @StateObject var viewModel = ViewModel()

    
    @State var places: [Place] = placeData
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(){
                Slider(value: $gridColumn, in: 1...4)
                    .padding()
                    .onChange(of: gridColumn) { value in
                        gridSwitch()
                    }
//                    Button(action: {
//                        places.shuffle()
//
//                    }) {
//                        Image(systemName: "arrow.2.squarepath")
//                            .imageScale(.large)
//                            .padding()
//                    }
                }
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(viewModel.tryData, id:\.self) { item in
                            AsyncImage(url: URL(string: item.galleryImage)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .cornerRadius(15)
                        }
                    }
                    
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Scroll through beatuies of Slovakia")
            .navigationBarTitleDisplayMode(.inline)
            
        }.onAppear{
            viewModel.fetch()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
