//
//  AppDelegate.swift
//  Movie
//
//  Created by Pierre Perrin on 17/02/2018.
//Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

let FlymingoImageCache = AutoPurgingImageCache(
    memoryCapacity: 100 * 1024 * 1024,
    preferredMemoryUsageAfterPurge: 20 * 1024 * 1024
)


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let imageDownloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .fifo,
        maximumActiveDownloads: 4,
        imageCache: AutoPurgingImageCache()
    )
    
    var window: UIWindow?
    var notificationToken: NotificationToken? = nil
    
    func initializeAlamofireImage(){
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.urlCache = URLCache.init(memoryCapacity:100 * 1024 * 1024, diskCapacity:200 * 1024 * 1024, diskPath:nil)
        UIImageView.af_sharedImageDownloader = ImageDownloader.init(sessionManager: SessionManager.init(configuration: sessionConfiguration), downloadPrioritization: ImageDownloader.DownloadPrioritization.lifo, maximumActiveDownloads: 5, imageCache: FlymingoImageCache)
        
        DataRequest.addAcceptableImageContentTypes(["application/media"])
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.initializeAlamofireImage()
        TMDBApiManager.default.resquestForMoreMovies()
        return true
    }
    
  
}

