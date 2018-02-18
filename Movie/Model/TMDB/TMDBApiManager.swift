//
//  TMDBApiManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBApiManager :NSObject{
    
    static let `default` = {return TMDBApiManager()}()
    
    /// The TMDB Api manager
    let kTheMovieDataBaseAPI : MoAPI = {
        
        let api = MoAPI.init(apiKeyKey: "api_key",
                             apiKey: "fbdebfd2e2f07b218917612ba8e0a4c9",
                             hostUrl: "https://api.themoviedb.org/3/")
        return api
    }()
}
