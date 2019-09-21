//
//  getSongs.swift
//  shufflesongs
//
//  Created by antonio marcos on 16/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import Foundation

class GetSongs{
    
    init(){}
    
    func executeUseCase(onComplete: @escaping ([Song]) -> Void, onError: @escaping (RequestError) -> Void) {
        SongsRemoteDataSource.getSongs(onComplete: { (Song) in
            onComplete(Song)
        }) { (error) in
            onError(error)
        }
    }
}
