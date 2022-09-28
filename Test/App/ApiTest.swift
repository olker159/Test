//
//  Api_test.swift
//  Test
//
//  Created by Oliver Pavlovsky on 05/08/2022.
//

import SwiftUI


//let url = "https://bi6w9tcb.api.sanity.io/v2021-03-25/data/query/production?query=*%5B_type%20%3D%3D%20'place'%5D%20"
//class ViewModel: ObservableObject {
//    
//    @Published var tryData: [Result] = []
//    /*
//     init(newResult: Result){
//     nameData = NameData(result: [])
//     }*/
//    
//    func fetch(){
//        
//        guard let url = URL(string: "http://localhost:8000/result")
//                
//        else{
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {  data, response, error in
//            if let data = data {
//                
//                do {
//                    print(data)
//                    let tryData = try JSONDecoder().decode([Result].self, from: data)
//                    OperationQueue.main.addOperation {
//                        self.tryData = tryData
//                        //print(tryData.first!.description)
//                        
//                    }
//                    
//                }
//                catch{
//                    print("Error ---> \(error)")
//                }
//            }
//        }
//        task.resume()
//    }
//}


struct ApiTest: View {
    
    //@StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        NavigationView{
            
            
//            List{
//                ForEach(viewModel.tryData, id:\.self) { name in
//                    Text(name.name)
//                }
//            }
//            .navigationTitle("ABC")
//            .onAppear{
//                viewModel.fetch()
//            }
            
        }
    }
    
}

struct Api_test_Previews: PreviewProvider {
    static var previews: some View {
        ApiTest()
    }
}

