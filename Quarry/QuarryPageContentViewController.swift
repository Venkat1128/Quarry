//
//  QuarryPageContentViewController.swift
//  Quarry
//
//  Created by Venkat on 13/05/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit

class QuarryPageContentViewController: UIViewController {

    @IBOutlet weak var topicpptImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var pageIndex: Int?
    var titleText : String!
    var imageName : String!
    let imageTapgeature = UITapGestureRecognizer()
    var detailText : NSMutableAttributedString!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topicpptImage.image = UIImage(named: imageName)
        self.topicpptImage.layer.borderColor = UIColor.brownColor().CGColor
        self.topicpptImage.layer.borderWidth = 2
        self.topicpptImage.layer.cornerRadius = 10
        self.titleLabel.text = self.titleText
        self.titleLabel.alpha = 0.1
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.titleLabel.alpha = 1.0
        })
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(QuarryPageContentViewController.tappedView))
        topicpptImage.addGestureRecognizer(tap)
        topicpptImage.userInteractionEnabled = true
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
    func tappedView(){
        let detailViewTextView = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
        detailViewTextView.detailTextContent = detailText
        detailViewTextView.title = self.titleText
        let navController = UINavigationController(rootViewController: detailViewTextView)
        detailViewTextView.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done,target: self,action: #selector(QuarryPageContentViewController.dismiss))
        self.presentViewController(navController, animated: true, completion: nil)
    }
    func dismiss(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
