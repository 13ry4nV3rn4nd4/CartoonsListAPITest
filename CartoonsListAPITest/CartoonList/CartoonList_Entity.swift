//
//  CartoonList_Entity.swift
//  CartoonsListAPITest
//
//  Created by Bryan Vernanda on 20/09/24.
//

import Foundation

struct Cartoon: Decodable {
    let title: String
    let year: Int
    let creator: [String]
    let rating: String
    let genre: [String]
    let runtime_in_minutes: Int
    let episodes: Int
    let image: String
    let id: Int
}
