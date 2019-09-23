//
//  SongsDataSource.swift
//  shufflesongs
//
//  Created by antonio marcos on 21/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import Foundation

protocol SongsDataSource{
    func getSongs(artistId: String, onComplete: @escaping ([Song]) -> Void, onError: @escaping (RequestError) -> Void)
}
