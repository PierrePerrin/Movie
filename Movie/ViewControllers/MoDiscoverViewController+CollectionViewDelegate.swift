//
//  MoDiscoverViewController.swift
//  Movie
//
//  Created by Pierre Perrin on 04/03/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

extension MoDiscoverViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y + scrollView.frame.size.height
        let size = scrollView.contentSize.height
        
        if size - offset < 500 && abs(lastRequest.timeIntervalSinceNow) > 5{
            
            TMDBApiManager.default.resquestForMoreMovies()
            lastRequest = Date()
        }
    }
}
