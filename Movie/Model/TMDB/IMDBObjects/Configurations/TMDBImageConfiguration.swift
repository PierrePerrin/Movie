//
//  TMDBImageConfiguration.swift
//  Movie
//
//  Created by Pierre Perrin on 04/03/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

class TMDBImageConfiguration: TMDBObject  {

    
    @objc dynamic var base_url : String? = nil
    @objc dynamic var secure_base_url : String? = nil
    
    override class func primaryKey() -> String?{
        return "base_url"
    }
    
    class func imageUrl(forPath path :String) -> URL?{
        let object = mo_getObjects(forType: TMDBImageConfiguration.self)?.first
        guard let url = object?.secure_base_url ?? object?.base_url else{return nil}
        return URL.init(string: url + "/w342/" + path)
    }
}
