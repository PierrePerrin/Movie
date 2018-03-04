//
//  TMDBApiManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

class TMDBDiscoverRequest:TMDBApiRequestType{
    
    var currentPage = 0
    
    override var responseObjectType : TMDBObject.Type {
        return TMDBMovie.self
    }
    
    override var path : String {
        return "discover/movie"
    }
    
    override func performRequest(parameters : Parameters? = nil,completion:(() -> Void)? = nil) {
        self.currentPage += 1
        
        var parameters = Parameters.init()
        parameters["page"] = self.currentPage
        super.performRequest(parameters: parameters, completion: completion)
    }
}

