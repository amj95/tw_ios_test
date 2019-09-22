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
                    self.shuffleSongs()
                }
            }) { (error) in
                
            }
        }
    }
    
    func shuffleSongs(){
        self.mViewSongsDelegate?.displaySongs(songs: self.data)
    }
}
