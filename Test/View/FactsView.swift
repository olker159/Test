//
//  FactsView.swift
//  Test
//
//  Created by Oliver Pavlovsky on 21/07/2022.
//

import SwiftUI

struct FactsView: View {

    
    var factsTry: [String]
    
    var body: some View {
            ZStack{
                TabView{
                    ForEach(factsTry, id: \.self) { item in
                        Text(item)
                            .padding()
                            .foregroundColor(.black)
                            .background(Rectangle().frame(minHeight: 148, idealHeight: 168, maxHeight: 180).shadow(radius: 3).cornerRadius(15))
                            
                }
            }
                .tabViewStyle(PageTabViewStyle())
                .onAppear {
                      setupAppearance()
                    }
                .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
                .cornerRadius(15)
                
        }
 
    }
        
    }
func setupAppearance() {
  UIPageControl.appearance().currentPageIndicatorTintColor = .black
  UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(factsTry: [""])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
