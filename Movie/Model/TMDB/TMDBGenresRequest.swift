//
//  TMDBApiManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

class TMDBGenresRequest:TMDBApiRequestType{
    
    override var responseObjectType : TMDBObject.Type {
        return TMDBMovieGenre.self
    }
    
    override var responseKey : String{
        return "genres"
    }
    
    override var path : String {
        return "genre/movie/list"
    }
}

