//
//  ContentView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 18/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    var place: [Place] = placeData
    let gridLayout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            NavigationView{
                ScrollView {
                    Group{
                        
                        VStack{
                            ImagesTabView()
                                .frame(height: 230)
                                .listRowInsets(EdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0))
                            HStack(alignment: .center){
                                //Image(systemName: "info.circle")
                                Text("Informations")
                                    .fontWeight(.bold)
                                
                            }
                            .font(.title)
                            Divider()
                            Group {
                                Text("Once part of Czechoslovakia, this mountainous, somewhat sparsely populated country has much to offer visitors. Known for its national parks, scenic hiking trails, and hundreds of caves – some of which are UNESCO-protected sites – Slovakia is a dream destination for outdoor lovers. History buffs and foodies will be equally pleased to visit, however, as there's a wealth of opportunities to jump right into exploring and tasting delicacies.")
                                
                                Text("Slovakia's open-air museums offer a unique chance to discover the folk traditions of the country, while a visit to Bratislava will give you a chance to experience a vibrant city touched by a dark history.")
                            }
                            .padding(.top, 5)
                            .padding(.bottom)
                            .lineLimit(.max)
                            .multilineTextAlignment(.center)
                            
                        }
                        
                        Text("Top 10 places to visit".uppercased())
                            .fontWeight(.bold)
                            .padding(.vertical,5)
                            .font(.title)
                        
                        Text("Click for more informations")
                            .fontWeight(.semibold)
                            .padding(.bottom,10)
                        
                        
                        
                        ForEach(viewModel.tryData, id:\.self) { name in
                            NavigationLink(destination: PlaceDetailView(image: URL(string: name.image)!, name: name.name, shortDesc: name.shortDescription, descr: name.description, factsTry: name.facts)) {
                                PlaceListItemView(nameTry: name.name, shortDescTry: name.shortDescription,image: URL(string: name.image)!)
                            }
                            
                        }
                        
                    }.onAppear{
                        viewModel.fetch()
                    }
                    .toolbar {
                        
                        ToolbarItem(placement: .principal) {
                            Text("Tourism guide for Slovakia")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                            
                            
                        }
                        
                    }
                }
                
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
