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
    
    init(getSongs: GetSongs){
        self.mGetSongs = getSongs
    }
    
    func setViewDelegate(viewSongsDelegate: ViewSongsDelegate?){
        self.mViewSongsDelegate = viewSongsDelegate
    }
    
    func getSongs(){
        mGetSongs.executeUseCase(onComplete: { (Song) in
            DispatchQueue.main.async {
                self.shuffleSongs(songs: Song)
            }
        }) { (error) in
            
        }
    }
    
    func shuffleSongs(songs: [Song]){
        self.mViewSongsDelegate?.displaySongs(songs: songs)
    }
}
