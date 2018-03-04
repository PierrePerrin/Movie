//
//  TMDBObject.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBMovieGenre: TMDBObject {

    @objc dynamic var name : String? = nil
    let movie = LinkingObjects(fromType: TMDBMovie.self, property: "genres")
}
