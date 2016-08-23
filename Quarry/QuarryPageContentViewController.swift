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
    var titleLabelText : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*self.topicpptImage.image = UIImage(named: imageName)
        self.topicpptImage.layer.borderColor = UIColor.brownColor().CGColor
        self.topicpptImage.layer.borderWidth = 2
        self.topicpptImage.layer.cornerRadius = 10*/
        self.titleLabel.text = self.titleLabelText
        let tap = UITapGestureRecognizer(target: self, action: #selector(QuarryPageContentViewController.tappedView))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
        //topicpptImage.userInteractionEnabled = true
        assignbackground()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func assignbackground(){
        let background = UIImage(named: "quarry_bg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
         view.addSubview(imageView)
         self.view.sendSubviewToBack(imageView)
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
      
        let detailViewPageMenu = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryDetailViewController") as! QuarryDetailViewController
        detailViewPageMenu.titleLabelText = titleLabelText
        detailViewPageMenu.title = self.titleText
        let navController = UINavigationController(rootViewController: detailViewPageMenu)
        navController.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        detailViewPageMenu.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done,target: self,action: #selector(QuarryPageContentViewController.dismiss))
        dispatch_async(dispatch_get_main_queue(), {
            self.presentViewController(navController, animated: true, completion: nil)
        })
    }
    func dismiss(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
