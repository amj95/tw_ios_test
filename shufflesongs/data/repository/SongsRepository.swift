//
//  SongsRepository.swift
//  shufflesongs
//
//  Created by antonio marcos on 21/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import Foundation

/*
    Concrete implementation of a repository to load songs from data source into cache
*/

class SongsRepository : SongsDataSource {
    
    private static var INSTANCE: SongsRepository? = nil
    private var mRemoteDataSource : SongsDataSource
    
    //This variable store all previous requests for instant responses
    var mCacheData = [String : [Song]]()
    
    private init(remoteDataSource : SongsDataSource){
        mRemoteDataSource = remoteDataSource
    }
    
    public static func getInstance(remoteDataSource : SongsDataSource) -> SongsRepository{
        if(INSTANCE == nil){
            INSTANCE = SongsRepository(remoteDataSource: remoteDataSource)
        }
        return INSTANCE!
    }
    
    func getSongs(artistId: String, onComplete: @escaping ([Song]) -> Void, onError: @escaping (RequestError) -> Void) {
        if let storedResponse = mCacheData[artistId]{
            onComplete(storedResponse)
        }else{
            mRemoteDataSource.getSongs(artistId: artistId, onComplete: { (Song) in
                onComplete(Song)
                self.refreshCache(artistId: artistId, songs: Song)
            }) { (error) in
                onError(error)
            }
        }
    }
    
    func refreshCache(artistId: String, songs: [Song]){
        mCacheData[artistId] = songs
    }
}
