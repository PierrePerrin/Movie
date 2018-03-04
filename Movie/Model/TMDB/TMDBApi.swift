//
//  TMDBApiManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


private let instance = TMDBApiManager()
class TMDBApiManager :NSObject{
    
    var apisCache = [String:TMDBApiRequestType]()
    
    class var `default` : TMDBApiManager {return instance}
    
    private var isInitilized:Bool = false
    func initialize(){
        updateConfigurations()
        updateMoviesGenres()
    }
    /// The TMDB Api manager
    let api : MoAPI = {
        
        let api = MoAPI.init(apiKeyKey: "api_key",
                             apiKey: "fbdebfd2e2f07b218917612ba8e0a4c9",
                             hostUrl: "https://api.themoviedb.org/3/")
        return api
    }()
    
    func api<T : TMDBApiRequestType>(ofType type: T.Type) -> T? {
        if !isInitilized{
            isInitilized = true
            self.initialize()
        }
        
        let stringType = String(describing: type)
        guard let object = apisCache[stringType] else{
            
            let object = T.init()
            apisCache[stringType] = object
            return object
        }
        return object as? T
    }
    
    func updateMoviesGenres(){
        api(ofType: TMDBGenresRequest.self)?.performRequest()
    }
    
    func updateConfigurations(){
        api(ofType: TMDBConfigRequest.self)?.performRequest()
    }
    
    func resquestForMoreMovies(){
        api(ofType: TMDBDiscoverRequest.self)?.performRequest()
    }
}

