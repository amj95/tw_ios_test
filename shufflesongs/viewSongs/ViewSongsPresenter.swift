//
//  ViewSongsPresenter.swift
//  shufflesongs
//
//  Created by antonio marcos on 16/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import UIKit

protocol ViewSongsDelegate: NSObjectProtocol{
    func displaySongs(songs: [Song])
}

class ViewSongsPresenter {
    private let mGetSongs: GetSongs
    weak private var mViewSongsDelegate: ViewSongsDelegate?
    var data: [Song] = []
    var artistIds: [String] = ["909253","1171421960","358714030","1419227","264111789"]
    
    init(getSongs: GetSongs){
        self.mGetSongs = getSongs
    }
    
    func setViewDelegate(viewSongsDelegate: ViewSongsDelegate?){
        self.mViewSongsDelegate = viewSongsDelegate
    }
    
    func getSongs(){
        for artistId in artistIds{
            mGetSongs.executeUseCase(artistId: artistId,onComplete: { (Song) in
                DispatchQueue.main.async {
                    self.data += Song
                    self.shuffleSongs(songs: self.data)
                }
            }) { (error) in
                
            }
        }
    }
    
    func actionShuffleSongs(){
        self.shuffleSongs(songs: self.data)
    }
    
    func shuffleSongs(songs: [Song]){
        var toShuffleSongs = songs
        var shuffledSogs: [Song] = []
        
        while(toShuffleSongs.count > 0){
            
            let randomPos = Int.random(in: 0 ..< toShuffleSongs.count)
            let songRandom: Song = toShuffleSongs[randomPos]
            
            if(shuffledSogs.count == 0){// case array is empty adds the first
                shuffledSogs.append(songRandom)
                toShuffleSongs.remove(at: randomPos)
            }else{
                let lastSong: Song = shuffledSogs[(shuffledSogs.count-1)]
                if(lastSong.artistName != songRandom.artistName){ // if last item is not same artist
                    shuffledSogs.append(songRandom)
                    toShuffleSongs.remove(at: randomPos)
                }else{
                    if(!isShufflable()){//if is not more shufflable
                        break
                    }
                }
            }
        }
        
        self.data = shuffledSogs + toShuffleSongs
        self.mViewSongsDelegate?.displaySongs(songs: shuffledSogs)
    }
    
    func isShufflable()->Bool{
        let temp = self.data[0]
        for song in self.data{
            if(song.artistName != temp.artistName){
                return true
            }
        }
        return false
    }
}
