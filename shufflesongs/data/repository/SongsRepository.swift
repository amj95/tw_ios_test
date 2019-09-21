//
//  SongsRepository.swift
//  shufflesongs
//
//  Created by antonio marcos on 21/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import Foundation

class SongsRepository{
    
    static let INSTANCE = SongsRepository()
    
    private init(){}
    
    func getSongs(onComplete: @escaping ([Song]) -> Void, onError: @escaping (RequestError) -> Void) {
        SongsRemoteDataSource.getSongs(onComplete: { (Song) in
            onComplete(Song)
        }) { (error) in
            onError(error)
        }
    }
}