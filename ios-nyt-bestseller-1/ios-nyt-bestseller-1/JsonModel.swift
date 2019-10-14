//
//  JsonModel.swift
//  ios-nyt-bestseller-1
//
//  Created by Mario Holper on 11.10.19.
//  Copyright © 2019 Mario Holper. All rights reserved.
//

import Foundation

struct NytTop : Codable {
    let results: [Result]
}

struct Result : Codable {
    let rank: Int
    let amazon_product_url: String?
    let book_details: [BookDetail]?
}

struct BookDetail : Codable {
    let title: String?
    let description: String?
    let author: String?
}
