//
//  AppResponse.swift
//  CombineAppleApi
//
//  Created by Mac-11 on 04/09/23.
//


import Foundation

struct AppsResponseon: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable ,Hashable{
    let results: [Apps]
}

// MARK: - Result
public struct Apps: Codable,Hashable {
    let artistName, id, name, releaseDate: String
    let artworkUrl100: String
    let url: String
}
