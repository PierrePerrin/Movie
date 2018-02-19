//
//  AppDelegate.swift
//  Movie
//
//  Created by Pierre Perrin on 17/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var notificationToken: NotificationToken? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        TMDBApiManager.default.api(ofType: TMDBDiscoverRequest.self)?.performRequest()
        TMDBApiManager.default.api(ofType: TMDBDiscoverRequest.self)?.performRequest()
        TMDBApiManager.default.api(ofType: TMDBDiscoverRequest.self)?.performRequest()
        TMDBApiManager.default.api(ofType: TMDBDiscoverRequest.self)?.performRequest()
        
        if let movieResults = mo_getObjects(forType: TMDBMovie.self){
         
           notificationToken =  movieResults.observe({ [weak self] (changes: RealmCollectionChange) in
                
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                break
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                break
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
            })
        }
        
        
        
        return true
    }
    
    func updateMoviesGenres(){
        TMDBApiManager.default.api(ofType: TMDBGenresRequest.self)?.performRequest()
    }
}

