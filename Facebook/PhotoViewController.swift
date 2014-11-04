//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Hearsay Guest on 11/2/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoActions: UIImageView!
    @IBOutlet var backgroundView: UIView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image

        photoScrollView.contentSize = CGSize(width: 320, height: 620)
        photoScrollView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onDoneTap(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var number = 1 - abs(photoScrollView.contentOffset.y/500)
        
        photoActions.alpha = 0.0001
        doneButton.alpha = 0.0001
        backgroundView.alpha = number
    
        if photoScrollView.contentOffset.y > 60.0 {
            dismissViewControllerAnimated(true, completion: nil)
        } else if photoScrollView.contentOffset.y < -60.0 {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            photoScrollView.contentOffset.y == 0.0
            println("\(photoScrollView.contentOffset.y)")
        }
        
    }
    
    
}
