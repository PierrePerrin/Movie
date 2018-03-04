//
//  MoDiscoverViewController.swift
//  Movie
//
//  Created by Pierre Perrin on 04/03/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

extension MoDiscoverViewController: UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for index in indexPaths{
            let row = index.row
            guard let movie = self.movieResults?[row],
            let path = movie.poster_path,
            let url = TMDBImageConfiguration.imageUrl(forPath: path) else{continue}
            
            let image = UIImageView()
            image.af_setImage(withURL: url)
        }
    }

}
