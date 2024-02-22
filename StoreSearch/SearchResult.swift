//
//  SearchResult.swift
//  StoreSearch
//
//  Created by JAM on 2/21/24.
//

import Foundation

class ResultArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

class SearchResult: Codable, CustomStringConvertible {
    var artistName: String? = ""
    var trackName: String? = ""
    
    var name: String {
        return trackName ?? ""
    }
    var description: String {
        return "\nResult - Name: \(name), Artist Name: \(artistName ?? "None")"
    }
}
