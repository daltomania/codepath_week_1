//
//  MovieDetailsViewController.swift
//  codepath_week_1
//
//  Created by Will Dalton on 8/31/15.
//  Copyright (c) 2015 daltomania. All rights reserved.
//

import UIKit
import AFNetworking

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageUrl = movie.valueForKeyPath("posters.thumbnail") as! String
        let range = imageUrl.rangeOfString(".*cloudfront.net/", options: .RegularExpressionSearch)
        if let range = range {
           imageUrl = imageUrl.stringByReplacingCharactersInRange(range, withString: "https://content6.flixster.com/")
        }
        
        let url = NSURL(string: imageUrl)!
        imageView.setImageWithURL(url)
        
        let title = movie["title"] as? String
        self.navigationItem.title = title
        titleLabel.text = title
        synopsisLabel.text = movie["synopsis"] as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
