//
//  RequestsViewController.swift
//  Facebook
//
//  Created by Hearsay Guest on 10/9/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 1006)
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 35, right: 0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
