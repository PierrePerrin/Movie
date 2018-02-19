//
//  TMDBApiManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBApiManager :NSObject{
    
    var apisCache = [String:TMDBApiRequestType]()
    
    static let `default` = {return TMDBApiManager()}()
    
    /// The TMDB Api manager
    let api : MoAPI = {
        
        let api = MoAPI.init(apiKeyKey: "api_key",
                             apiKey: "fbdebfd2e2f07b218917612ba8e0a4c9",
                             hostUrl: "https://api.themoviedb.org/3/")
        return api
    }()
    
    func api<T : TMDBApiRequestType>(ofType type: T.Type) -> T? {
        let stringType = String(describing: type)
        guard let object = apisCache[stringType] else{
        
            let object = T.init()
            apisCache[stringType] = object
            return object
        }
        return object as? T
    }
}
