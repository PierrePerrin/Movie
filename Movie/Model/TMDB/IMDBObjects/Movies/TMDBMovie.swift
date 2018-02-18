//
//  TMDBObject.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBMovie: TMDBObject {

    @objc dynamic var imdb_id : String? = nil
    @objc dynamic var homepage : String? = nil
    
    @objc dynamic var title : String? = nil
    @objc dynamic var original_title : String? = nil
    @objc dynamic var original_language : String? = nil
    @objc dynamic var overview : String? = nil
    @objc dynamic var release_date = -1
    @objc dynamic var status : String? = nil
    @objc dynamic var tagline : String? = nil
    @objc dynamic var video : Bool = false
    
    @objc dynamic var runtime = -1
    @objc dynamic var revenue = -1
    @objc dynamic var budget = -1

    @objc dynamic var popularity = -1
    @objc dynamic var vote_average = -1
    @objc dynamic var vote_count = -1
    
    //Medias
    @objc dynamic var poster_path : String? = nil
    @objc dynamic var backdrop_path : String? = nil
    
    //RelationShips
    let genres = List<TMDBMovieGenre>()
    let production_countries = List<TMDBMovieProductionCountry>()
    let production_companies = List<TMDBMovieProductionCompany>()
    let spoken_languages = List<TMDBMovieSpokenLanguage>()
}
