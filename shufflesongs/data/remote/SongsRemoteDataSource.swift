//
//  SongsRemoteDataSource.swift
//  shufflesongs
//
//  Created by antonio marcos on 21/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import Foundation

class SongsRemoteDataSource{
    
    private static let basePath = "https://us-central1-tw-exercicio-mobile.cloudfunctions.net/lookup?id="
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30.0
        return config
    }()
    private static let session = URLSession(configuration: configuration)
    
    class func getSongs(){
        guard let url = URL(string: basePath) else {return}
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error:
            Error?) in
            if error == nil{
                
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200{
                    guard let data = data else {return}
                    do{
                        let dataResponse = try JSONDecoder().decode(SongsResponse.self, from: data)
                        print(dataResponse)
                    }catch{
                        print(error.localizedDescription)
                    }
                }else{
                    print("Invalid server code")
                }
            } else{
                print(error!)
            }
    }
        dataTask.resume()
    }
}
