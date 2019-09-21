//
//  Song.swift
//  shufflesongs
//
//  Created by antonio marcos on 16/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//
import Foundation

// MARK: - SongsResponse
struct SongsResponse: Codable {
    let resultCount: Int
    let results: [Song]
}

// MARK: - Result
struct Song: Codable {
    let id: Int
    let wrapperType: String
    let artistType: String?
    let primaryGenreName, artistName: String
    let trackTimeMillis: Int?
    let collectionName, trackExplicitness, trackCensoredName: String?
    let collectionID: Int?
    let trackName, country: String?
    let artworkURL: String?
    let artistID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, wrapperType, artistType, primaryGenreName, artistName, trackTimeMillis, collectionName, trackExplicitness, trackCensoredName
        case collectionID = "collectionId"
        case trackName, country
        case artworkURL = "artworkUrl"
        case artistID = "artistId"
    }
}
