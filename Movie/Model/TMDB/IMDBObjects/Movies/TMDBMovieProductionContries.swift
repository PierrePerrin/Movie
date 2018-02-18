//
//  TMDBObject.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBMovieSpokenLanguage: Object {

    @objc dynamic var iso_639_1 : String? = nil
    @objc dynamic var name : String? = nil

    override class func primaryKey() -> String?{
        return "iso_639_1"
    }
}
