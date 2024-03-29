//
//  SongsRemoteDataSource.swift
//  shufflesongs
//
//  Created by antonio marcos on 21/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import Foundation

enum RequestError{
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}
/**
    Implementation of the data source that get songs from remote server
 */
class SongsRemoteDataSource : SongsDataSource{
    
    private static var INSTANCE: SongsRemoteDataSource? = nil
    private let basePath = "https://us-central1-tw-exercicio-mobile.cloudfunctions.net/lookup?limit=5"
    private let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30.0
        return config
    }()
    private var session : URLSession
    
    public static func getInstance() -> SongsRemoteDataSource{
        if(INSTANCE == nil){
            INSTANCE = SongsRemoteDataSource()
        }
        return INSTANCE!
    }
    
    // Prevents direct instantiation.
    init(){
        session = URLSession(configuration: configuration)
    }
    
    /*:
     - Note: onError is fired if the server can't be contacted or returns error
     */
    func getSongs(artistId: String, onComplete: @escaping ([Song]) -> Void, onError: @escaping (RequestError) -> Void) {
        guard let url = URL(string: basePath + "&id=" + artistId) else {
            onError(.url)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error:
            Error?) in
            if error == nil{
                
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200{
                    guard let data = data else {return}
                    do{
                        let dataResponse = try JSONDecoder().decode(SongsResponse.self, from: data)
                        onComplete(dataResponse.results)
                    }catch{
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                }else{
                    print("Invalid server code")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else{
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
}
