//
//  TMDBApiManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

class TMDBConfigRequest:TMDBApiRequestType{
    
    override var responseObjectType : TMDBObject.Type {
        return TMDBImageConfiguration.self
    }
    
    override var responseKey : String{
        return "images"
    }
    
    override var path : String {
        return "configuration"
    }
}

