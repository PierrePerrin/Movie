//
//  MoDiscoverViewController.swift
//  Movie
//
//  Created by Pierre Perrin on 04/03/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

import UIKit

class MoDiscoverViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView?
    var resultsToken : NotificationToken?
    
    var lastRequest = Date.init(timeInterval: -10, since: Date())
    
    lazy var movieResults : Results<TMDBMovie>? = {
        return mo_getObjects(forType: TMDBMovie.self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.observeResultsChanges()
        // Do any additional setup after loading the view.
    }
    
    func observeResultsChanges(){
        
        resultsToken = movieResults?.observe { [weak self] (changes: RealmCollectionChange) in
            guard let collectionView = self?.collectionView else { return }
            switch changes {
            case .initial:
     
                collectionView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):

                collectionView.performBatchUpdates({
                    
                    collectionView.insertItems(at:
                        insertions.map({
                            IndexPath(row: $0, section: 0)
                        }))
                    
                    collectionView.insertItems(at:
                        deletions.map({
                            IndexPath(row: $0, section: 0)
                        }))
                    
                    collectionView.reloadItems(at:
                        modifications.map({
                        IndexPath(row: $0, section: 0)
                    }))
                    
                }, completion: nil)
                
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    deinit {
        resultsToken?.invalidate()
        resultsToken = nil
    }

}
