//
//  TMDBObject.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBObject: MoObject {

    override class var api: MoAPI{
        return TMDBApiManager.default.kTheMovieDataBaseAPI
    }
    
    @objc dynamic var id = -1

    override class func primaryKey() -> String?{
        return "id"
    }
}
