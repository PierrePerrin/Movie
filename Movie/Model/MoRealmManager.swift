//
//  MoRealmManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

class MoRealmManager: NSObject {

    static let `default` = {return MoRealmManager()}()
    
    lazy var configuration : Realm.Configuration = {
        var configuration = Realm.Configuration.defaultConfiguration
        configuration.deleteRealmIfMigrationNeeded = true
        return configuration
    }()
    
    var realm : Realm?{
        return try? Realm.init(configuration: configuration)
    }
}

func mo_getObjects<T:MoObject>(forType:T.Type) -> Results<T>? {
    return MoRealmManager.default.realm?.objects(T.self)
}
