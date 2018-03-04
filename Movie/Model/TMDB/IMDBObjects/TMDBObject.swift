//
//  TMDBObject.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


class TMDBObject: MoObject {
    
    required override init(value: Any) {
        super.init(value: value)
    }
    
    required init() {
        super.init()
    }
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    @objc dynamic var id = -1

    override class func primaryKey() -> String?{
        return "id"
    }
    
    class func getObjects() -> Results<TMDBObject>?{
        
        return MoRealmManager.default.realm?.objects(self)
    }
}
