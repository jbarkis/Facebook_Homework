//
//  FeedViewController.swift
//  Facebook
//
//  Created by Hearsay Guest on 10/9/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

// Declare views
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var weddingOneView: UIImageView!
    @IBOutlet weak var weddingTwoView: UIImageView!
    @IBOutlet weak var weddingThreeView: UIImageView!
    @IBOutlet weak var weddingFourView: UIImageView!
    @IBOutlet weak var weddingFiveView: UIImageView!
    
    var isPresenting: Bool = true
    var imageCopyView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1538)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
// Group: Tap Navigation from Feed to Photo
    
    @IBAction func onWeddingOneTap(sender: UITapGestureRecognizer) {
        self.imageCopyView = UIImageView()
        self.imageCopyView.image = weddingOneView.image
        self.imageCopyView.contentMode = self.weddingOneView.contentMode
        self.imageCopyView.frame = self.weddingOneView.frame

    // Perform Segue
        performSegueWithIdentifier("feedToPhoto", sender: self)

    }

    @IBAction func onWeddingTwoTap(sender: UITapGestureRecognizer) {
        self.imageCopyView = UIImageView()
        self.imageCopyView.image = weddingTwoView.image
//        self.imageCopyView.contentMode = self.weddingTwoView.contentMode
        self.imageCopyView.frame = self.weddingTwoView.frame
 
    //Perform Segue
        performSegueWithIdentifier("feedToPhoto", sender: self)

    }
    
    @IBAction func onWeddingThreeTap(sender: UITapGestureRecognizer) {
        self.imageCopyView = UIImageView()
        self.imageCopyView.image = weddingThreeView.image
        self.imageCopyView.contentMode = self.weddingThreeView.contentMode
        self.imageCopyView.frame = self.weddingThreeView.frame
        
    //Perform Segue
        performSegueWithIdentifier("feedToPhoto", sender: self)

    }
    
    @IBAction func onWeddingFourTap(sender: UITapGestureRecognizer) {
        self.imageCopyView = UIImageView()
        self.imageCopyView.image = weddingFourView.image
//        self.imageCopyView.contentMode = self.weddingFourView.contentMode
        self.imageCopyView.frame = self.weddingFourView.frame
        
    //Perform Segue
        performSegueWithIdentifier("feedToPhoto", sender: self)

    }
    
    @IBAction func onWeddingFiveTap(sender: UITapGestureRecognizer) {
        self.imageCopyView = UIImageView()
        self.imageCopyView.image = weddingFiveView.image
//        self.imageCopyView.contentMode = self.weddingFiveView.contentMode
        self.imageCopyView.frame = self.weddingFiveView.frame
        
    //Perform Segue
        performSegueWithIdentifier("feedToPhoto", sender: self)

    }
    
    
// Pass data with Segue
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        
        destinationViewController.image = self.imageCopyView.image
        
    }
    
    
//  Animate the transition
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!


    // Begin the transition
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            
            var photoViewController = toViewController as PhotoViewController
            photoViewController.imageView.hidden = true
            toViewController.view.alpha = 0
            
            var window = UIApplication.sharedApplication().keyWindow
            var imageFrame = window?.convertRect(photoViewController.imageView.frame, fromView: photoViewController.photoScrollView)
            var photoFrame = window?.convertRect(imageCopyView.frame, fromView: scrollView)
            var photoCopy = UIImageView(frame: photoFrame!)
            
            photoCopy.image = imageCopyView.image
            photoCopy.contentMode = UIViewContentMode.ScaleAspectFill //imageCopyView.contentMode
            window?.addSubview(photoCopy)


        // Animate the image
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                photoCopy.frame = imageFrame!
                photoCopy.contentMode = UIViewContentMode.ScaleAspectFit
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    photoCopy.removeFromSuperview()
                    photoViewController.imageView.hidden = false
                    transitionContext.completeTransition(true)
            }
        } else {
            
            var photoVC = fromViewController as PhotoViewController
            var returnWindow = UIApplication.sharedApplication().keyWindow
            var returnFrame = returnWindow?.convertRect(photoVC.imageView.frame, fromView: photoVC.photoScrollView)
            var returnPhoto = UIImageView(frame: returnFrame!)
            var homeFrame = returnWindow?.convertRect(imageCopyView.frame, fromView: scrollView)
            
            photoVC.imageView.contentMode = UIViewContentMode.ScaleAspectFit
            
            returnWindow?.addSubview(returnPhoto)
            returnPhoto.contentMode = UIViewContentMode.ScaleAspectFit
            returnPhoto.image = photoVC.imageView.image
            returnPhoto.hidden = false

            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                returnPhoto.frame = homeFrame!
                returnPhoto.contentMode = UIViewContentMode.ScaleAspectFill //self.imageCopyView.contentMode
                fromViewController.view.alpha = 0


                }) { (finished: Bool) -> Void in
                    returnPhoto.removeFromSuperview()
                    fromViewController.view.removeFromSuperview()
                    transitionContext.completeTransition(true)
                    
            }
        }
        
    }
    
    
    

}
