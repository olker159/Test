//
//  PreviewImages.swift
//  Test
//
//  Created by Oliver Pavlovsky on 18/07/2022.
//

import Foundation

struct CoverImage: Identifiable{
    let id = UUID()
    let name: String
}

let coverImageData: [CoverImage] = [
CoverImage(name: "swipe-1"),
CoverImage(name: "swipe-2"),
CoverImage(name: "swipe-3"),
CoverImage(name: "swipe-4")
]
