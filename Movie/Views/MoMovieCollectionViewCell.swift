//
//  MoMovieCollectionViewCell.swift
//  Movie
//
//  Created by Pierre Perrin on 04/03/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

class MoMovieCollectionViewCell: UICollectionViewCell {
    
    var movie:TMDBMovie?{
        didSet{
            self.movieView?.movie = movie
        }
    }
    
    @IBOutlet var movieView : MovieView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.movieView?.prepareForReuse()
    }
}
