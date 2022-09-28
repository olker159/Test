//
//  PlaceModel.swift
//  Test
//
//  Created by Oliver Pavlovsky on 19/07/2022.
//

import Foundation
import SwiftUI

struct TestData: Decodable{
    var result: Result
    
}

struct Results: Hashable, Codable{
    var results: [Result]
}

struct Result: Hashable,Codable{
    var id: Int
    var name: String
    var shortDescription: String
    var description: String
    var facts: [String]
    var image: String
    var galleryImage: String
    
}

class ViewModel: ObservableObject {
    
    
    @Published var tryData: [Result] = []
    
    func fetch(){
        
        guard let url = URL(string: "http://localhost:8000/result")
                
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {  data, response, error in
            if let data = data {
                
                do {
                    //print(data)
                    let tryData = try JSONDecoder().decode([Result].self, from: data)
                    OperationQueue.main.addOperation {
                        self.tryData = tryData
                        //print(tryData.first!.description)
                        
                    }
                    
                }
                catch{
                    print("Error ---> \(error)")
                }
            }
        }
        task.resume()
    }
}



struct Place: Identifiable, Decodable{
    var id = UUID()
    var name: String
    var image: String
    var galleryImage: String
    var shortDescription: String
    var description: String
    var facts: [String]
    
}
/*
@State var data = Place(name: "", image: "", galleryImage: "", shortDescription: "", description: "", facts: ["","",""])

func getData(){
    let urlString = "https://bi6w9tcb.api.sanity.io/v2021-10-21/data/query/production?query=*%5B0%5D"
    
    let url = URL(string: urlString)
    
    URLSession.shared.dataTask(with: url!) {data, _, error in
        DispatchQueue.main.async {
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    let decodeData = try decoder.decode(Place.self, from: data)
                    self.data = decodeData
                } catch{
                    print("Error...")
                }
            }
        }
    }.resume()
}
    */


let placeData: [Place] = [
Place(name: "Orava Castle", image: "orava-castle",galleryImage: "orava-castle-gall", shortDescription: "Orava Castle certainly looks impressive, as rolling hills lie off in the distance, and the Orava River runs below its imposing cliff face.",description: "One of the most beautiful castles in the whole of Slovakia, Orava Castle was built all the way back in the 13th century, although earlier wooden palisades and fortifications once occupied its prominent outcrop. \n\nAs each generation added its own touches and additions, the castle boasts a variety of architectural styles, with Romanesque, Gothic, and Renaissance features all evident. \n\nIts museum houses some wonderful old artifacts and archaeological findings that document its rich history. Throughout the many centuries that it has stood atop the bluff, the Orava Castle has never been conquered; it’s easy to see why once you pass through its many gates, walls, and defenses.", facts:
        [
            "In 1800, a fire broke out in the castle, which damaged it considerably. The reconstruction work progressed only slowly and continued until the 20th century.",
            "In 1922, the black-and-white film Nosferatu, which is basically just a copy of Stoker's famous Dracula, was filmed here.",
            "During the Second World War, Orava Castle served as an artillery observation post for German soldiers."
        ]),

Place(name: "Vlkolinec", image: "vlkolinec", galleryImage: "vlkolinec-gall", shortDescription: "One of the only remaining folk villages in the whole of Central Europe, Vlkolínec is full of impressive architecture.", description: "With traditional log houses lying next to a beautiful Baroque chapel and an antiquated old bell tower. A very quaint and charming place to visit, the tiny village is set in an idyllic spot amidst forest-clad hills and fields, with mountains seen in the distance.\n\nAs such, there are many great hikes you can do in the surrounding area. Besides that, there is not all that much to do other than take in the peaceful, laidback atmosphere and marvel at the fine folk architecture.", facts:
    [
        "Vlkolinec has been inscribed on the UNESCO World Heritage List since 1993.",
        "The fauna is typical of the mountain regions of Central Europe, including the brown bear (Ursus arctos), the common wolf (Canis lupus), and the lynx (Lynx lynx).",
        "The first (preserved) written mention of the village of Vlkolinec dates from 1461 (Wylkovinecz)."
]),

Place(name: "Bardejov", image: "bardejov", galleryImage: "bardejov-gall", shortDescription: "With a delightful historic center for you to explore, the well-preserved medieval town of Bardejov is certainly worth a visit.", description: "Life in the small town revolves around its beautiful marketplace, just as it did all those centuries ago. A number of fine Gothic and Renaissance townhouses surround the elegant Church of St. Aegidius, which lies at its heart.\nThere is also a splendid old synagogue for you to check out, as well as a small Jewish quarter, which is sadly all that remains of the town’s once-thriving Jewish population.\nLocated in the northeast of the country, with the Beskyd Mountains all around it, the town is surrounded by some fantastic 14th and 15th-century fortifications, with several interesting wooden churches scattered around the surrounding countryside.", facts:
    [
        "The oldest traces of residence and activity in the territory of Bardejov date back to the Stone Age.",
        "Bardejov was registered as a UNESCO World Heritage Site in 2000.",
        "The city center is made up of the Town Hall Square, which is surrounded on three sides by 46 burgher houses on narrow medieval plots."
    ]),


Place(name: "Kosice", image: "kosice", galleryImage: "kosice-gall", shortDescription: "Slovakia’s second-largest city has a wealth of great things for you to see and do, with fantastic bars, restaurants, and shops found alongside its many art galleries, museums, and theaters.", description: "Over the centuries, Kosice has been ruled by everyone from the Hungarians and Turks to the Czechs and Slovaks. As such, there is a myriad of amazing monuments, statues, and cultural landmarks for you to check out.\nWhile its thriving arts and culture scene is certainly worth exploring, no visit to Kosice can be complete without taking in all the fantastic sights and architecture found in its spectacular old town.\nBesides its stunning 14th century cathedral, there is a huge array of churches and palaces to see. Many people use Kosice as a base from which to explore the plethora of astonishing sights that dot the east of the country", facts:
    [
        "The Kosice Peace Marathon is also the second oldest in the world",
        "Kosice can boast of the largest zoo in Central Europe.",
        "Dome of St. Elizabeth is the largest church in Slovakia and is also the easternmost Gothic cathedral in Europe."
    ]),

Place(name: "Levoca", image: "levoca", galleryImage: "levoca-gall", shortDescription: "Lined with beautiful old townhouses, Levoca’s historic main square certainly is spectacular, with a glorious Gothic church and 15th-century town hall lying at its heart.", description: "Levoca is full of incredible historic sights and cultural landmarks, with lots of magnificent architecture scattered around town; you’ll see Baroque, Renaissance, and Gothic features.\nWhile its gorgeous main square is the highlight, there’s more than enough to keep you occupied for a day or two.The surrounding region is awash with amazing sights should you want to visit Spis \n\nCastle or the scenic Tatra Mountains. With a very laidback feel to it, Levoca is the perfect place to visit if you’re after a quiet getaway. When in town, a peaceful stroll up to the Church of Marianska Hora is a must for the fantastic views and its important spiritual significance.", facts:
    [
        "The Basilica of the Visitation of the Virgin Mary is located on Marianska hora, which is one of the oldest pilgrimage sites in eastern Slovakia.",
        "The main Gothic altar is the highest in the world (18.62 m) in the Basilica of St. Jakub.",
        "The castle system – almost completely preserved, six of the 15 bastions and towers have been preserved, including three gates."
    ]),

Place(name: "Spis Castle", image: "spis-castle", galleryImage: "spis-castle-gall", shortDescription: "Once the major center of power in the surrounding region, Spis Castle is now one of the most popular tourist destinations in Slovakia.", description:"Overlooking the town of Spisske Podhradie from on top of a hill, the vast ruins of Spis Castle cover a vast expanse of territory. As such, it should come as no surprise to learn that it is one of the largest castle complexes in the whole of Central Europe.\nWandering around its many walls, fortifications, and towers is an amazing experience, and the mind boggles at the sheer size and scale of everything. It’s easy to see why once you approach the castle and see its impressive features for yourself.", facts:
     [
        "It is the largest castle complex in Central Europe and at the same time belongs to the most extensive castle ruins from the Middle Ages.",
        "Spis Castle was never conquered. This happened thanks to several important points of defense.",
        "Several films were also shot on the grounds of Spiš Castle. For example, the plot of the first part of the Dragon's Heart takes place there."
     ]),

Place(name: "Banska Stiavnica", image: "banska-stiavnica", galleryImage: "banska-stiavnica-gall", shortDescription: "Lying at the center of what used to be an enormous caldera, Banská Štiavnica is a fascinating city to explore.", description: "Much of its fabulous wealth derives from the rich mineral deposits that were once found in the ground around the town.\nThe former mining town has a magnificent historic center, with lots of lovely churches, palaces, and museums. Wandering around town, you’ll pass many amazing historic sights and cultural landmarks.\nIn addition to all this, Banská Štiavnica also has two fantastic castles for you to visit, while the open-air mining museum is well worth checking out; it takes you deep underground to see what life in the mines was really like.", facts:
    [
        "The Banskostiavnica calvary is one of the most beautiful baroque calvaries in Europe.",
        "Banská Štiavnica and technical monuments in its vicinity was on the list of world cultural and natural heritage on 11.12.1993.",
        "The first university of a technical nature in the world was located here, and Banská Štiavnica became the center for the development of mining science and technology in Europe."
    ]
     ),

Place(name: "Slovak Paradise National Park", image: "slovak-paradise", galleryImage: "slovak-paradise-gall", shortDescription: "Encompassing a wide array of wild and rugged landscapes, the Slovak Paradise National Park is a breathtakingly beautiful part of the country to explore.", description: "Deep canyons, valleys, and rivers cut through the endless forests on show.The scenery is absolutely stunning wherever you go; amid the dense undergrowth, you can find sparkling waterfalls and deep rocky gorges, with the astounding Dobsinska Ice Cave just one of its main attractions.\nDue to all of the amazing natural sights found in the park, it really is a treat to explore, and a myriad of paths and trails snake through the glorious Solvak Paradise mountain range.\nAt times, you need to cross flimsy bridges that sway precariously to and fro, and clamber up steep ladders that hug the cliff face. The hike through the Sucha Bela Gorge is particularly challenging, but the beauty makes it well worth the effort.", facts:
     [
        "Kopanecke meadows with its 75 species of higher plants can probably boast the highest biodiversity in Europe.",
        "The Dobsin ice cave was the first in Europe to have electric lighting installed - it happened in 1887.",
        "The territory of the Slovak Paradise began to be protected from 21.8.1964 as the 1st Slovak protected landscape area."
     ]),

Place(name: "High Tatras", image: "high-tatras", galleryImage: "high-tatras-gall", shortDescription: "The majestic mountain range really is a sight to behold, its jagged peaks rise up imperiously towards the heavens.", description: "As they are home to the tallest mountains in the country, the High Tatras make for some unforgettable hiking and rock climbing, while in winter, there are loads of great slopes and pistes to ski down.\nOccupying an important place in the national psyche, the High Tatras are almost a national symbol, and the snow-capped Mount Krivan is the most distinctive peak.\nDue to the breathtakingly beautiful landscapes, the mountain range lends itself perfectly to all different types of outdoor activities. There are plenty of paths and trails for you to hike, cycle, or ski along, and the views are simply out of this world.", facts:
     [
        "The highest point in Slovakia is Gerlachovský štít, which measures 2655 m. You can only climb to the top with a certified guide.",
        "Krivan (2494 m) is a symbol of Slovakia. It is said that every Slovak must climb it at least once in his life.",
        "There are more than 100 mountain lakes in the Tatras."
     ]),

Place(name: "Bratislava", image: "bratislava", galleryImage: "bratislava-gall", shortDescription: "The nation’s capital and largest city, Bratislava has many different sides to it, and that is in part what makes it so fascinating to explore.", description: "At the historic heart of the city, one can find a magnificent hilltop castle and a range of medieval and Gothic buildings, with some fine Baroque palaces on display.\nStep out of the old town, and you’ll find communist-era concrete blocks lying alongside the Danube River that courses through Bratislava, while even further out, you’ll come across picturesque farms, fields, and villages.\nAmong this mesmerizing mix of old and new are loads of fantastic bars and restaurants for you to try, with more upmarket boutiques and trendy cafes springing up every year. As it boasts an ever-changing array of things for you to see and do, Bratislava never gets old. But if you should ever feel the need for a change of scenery, then both Vienna and Budapest lie nearby.", facts:
     [
        "Bratislava is the only European capital that borders two countries, namely Austria and Hungary.",
        "Bratislava and Vienna are the closest capitals in Europe. The distance between them is only 60 km.",
        "Bratislava is probably the only city where you can have lunch in a UFO."
     ])

]
