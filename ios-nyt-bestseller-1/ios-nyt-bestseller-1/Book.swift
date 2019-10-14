//
//  Book.swift
//  ios-nyt-bestseller-1
//
//  Created by Mario Holper on 11.10.19.
//  Copyright © 2019 Mario Holper. All rights reserved.
//

import Foundation

struct Book {
    let title: String
    let author: String
    let rank: Int
    let url: URL?
    
    init(title: String, author: String, rank: Int, url: URL?) {
        self.title = title
        self.author = author
        self.rank = rank
        self.url = url
    }
    
    static func loadBestseller() -> [Book] {
        var books = [Book]()
        let nyt = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=hcazhBNUn0ZemSbkXI6cD0UhMVavce8M&list=hardcover-fiction"
        let decoder = JSONDecoder()
        if let url = URL(string: nyt), let jsondata = try? Data(contentsOf: url) {
            do {
                let nyt = try decoder.decode(NytTop.self, from: jsondata)
                for r in nyt.results {
                    if let details = r.book_details?.first, let title = details.title, let author = details.author {
                        var amzn: URL? = nil
                        if let urlstring = r.amazon_product_url {
                            amzn = URL(string: urlstring)!
                        }
                        books.append(Book(title: title, author: author, rank: r.rank, url: amzn))
                    }
                }
            } catch{
                print("Fehler: \(error)")
            }
        }
        return books
    }
    
}
