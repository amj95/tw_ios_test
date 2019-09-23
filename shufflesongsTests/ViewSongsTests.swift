//
//  shufflesongsTests.swift
//  shufflesongsTests
//
//  Created by antonio marcos on 16/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import XCTest
@testable import shufflesongs

class ViewSongsTest: XCTestCase {

    var viewController: ViewSongsViewController!
    private let viewPresenter = ViewSongsPresenter(getSongs : GetSongs())
    
    func testExpectedOrderItems(){
        viewPresenter.setViewDelegate(viewSongsDelegate: viewController)
        var data: [Song] = []
        data.append(Song(id: 0, wrapperType: "", artistType: "", primaryGenreName: "", artistName: "John Dollar", trackTimeMillis: 0, collectionName: "", trackExplicitness: "", trackCensoredName: "", collectionID: 0, trackName: "m1", country: "", artworkURL: "", artistID: 0))
        data.append(Song(id: 0, wrapperType: "", artistType: "", primaryGenreName: "", artistName: "John Dollar", trackTimeMillis: 0, collectionName: "", trackExplicitness: "", trackCensoredName: "", collectionID: 0, trackName: "m2", country: "", artworkURL: "", artistID: 0))
        data.append(Song(id: 0, wrapperType: "", artistType: "", primaryGenreName: "", artistName: "MC Arianne", trackTimeMillis: 0, collectionName: "", trackExplicitness: "", trackCensoredName: "", collectionID: 0, trackName: "m3", country: "", artworkURL: "", artistID: 0))
        data.append(Song(id: 0, wrapperType: "", artistType: "", primaryGenreName: "", artistName: "MC Arianne", trackTimeMillis: 0, collectionName: "", trackExplicitness: "", trackCensoredName: "", collectionID: 0, trackName: "m4", country: "", artworkURL: "", artistID: 0))
        viewPresenter.data = data
        
        viewPresenter.shuffleSongs(songs: data)
        XCTAssertTrue(assertSongsAreShuffled())
    }
    
    func assertSongsAreShuffled() ->Bool{
        for i in 1 ... (viewPresenter.data.count-1){
            let lastSong: Song = viewPresenter.data[(i-1)]
            let actualSong: Song = viewPresenter.data[i]
            if(lastSong.artistName == actualSong.artistName){
                return false
            }
        }
        
        return true
    }

}
