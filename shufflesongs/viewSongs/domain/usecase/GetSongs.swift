//
//  getSongs.swift
//  shufflesongs
//
//  Created by antonio marcos on 16/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import Foundation

/*
    Fetches the list of songs.
*/

class GetSongs{
    
    private var mSongsRepository: SongsRepository
    
    init(songsRepository: SongsRepository){
        mSongsRepository = songsRepository
    }
    
    func executeUseCase(artistId: String, onComplete: @escaping ([Song]) -> Void, onError: @escaping (RequestError) -> Void) {
        mSongsRepository.getSongs(artistId: artistId, onComplete: { (Song) in
            var response: [Song] = []
            for temp in Song{
                if(temp.wrapperType == "track") {response.append(temp)}
            }
            onComplete(response)
        }) { (error) in
            onError(error)
        }
    }
}
