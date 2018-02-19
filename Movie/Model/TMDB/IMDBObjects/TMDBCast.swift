//
//  TMDBObject.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBCast: TMDBObject {

    @objc dynamic var cast_id = -1
    @objc dynamic var character : String? = nil
    @objc dynamic var credit_id : String? = nil
    @objc dynamic var gender = -1
    @objc dynamic var name : String? = nil
    @objc dynamic var profile_path : String? = nil
    @objc dynamic var order = -1
}
