//
//  HomeView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 18/07/2022.
//

import SwiftUI


struct MainView: View {

    var locData: [Locations] = locationsData
    @StateObject var viewModel = ViewModel()
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = false
    
    var body: some View {
        
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "house.circle.fill")
                        .imageScale(.large)
                    Text("Home")
                }
            GoogleMapsView(cities: locData)
                         .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "map.circle.fill")
                        .imageScale(.large)
                    Text("Locations")
                }
            GalleryView()
                .tabItem {
                    Image(systemName: "photo.circle.fill")
                        .imageScale(.large)
                    Text("Gallery")
                }
//            ApiTest()
//                .tabItem {
//                    Image(systemName: "exclamationmark.triangle.fill")
//                        .imageScale(.large)
//                    Text("Api Test")
//                }
            
        }//.background(Color.black)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
