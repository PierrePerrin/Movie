//
//  XibView.swift
//  Movie
//
//  Created by Pierre Perrin on 04/03/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

let imageAnimation = UIImageView.ImageTransition.crossDissolve(0.3)

@IBDesignable
class MovieView: XibView {
    
    @IBOutlet weak var backgroundImageView: UIImageView?
    @IBOutlet weak var coverImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?

    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundImageView?.image = nil
        self.coverImageView?.image = nil
        self.titleLabel?.text = nil
    }
    
    var movie : TMDBMovie?{
        didSet{
            self.titleLabel?.text = movie?.title
            self.getImageView()
        }
    }
    
    func getImageView(){
        
        guard let path = movie?.poster_path,
            let url = TMDBImageConfiguration.imageUrl(forPath: path)
            else{return}
        
        self.coverImageView?
            .af_setImage(withURL:url,
                         imageTransition:imageAnimation,
                         runImageTransitionIfCached: false)
        
    }
}

