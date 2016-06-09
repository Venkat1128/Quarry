//
//  QuarryPageContentDetailViewController.swift
//  Quarry
//
//  Created by Venkat on 23/05/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit

class QuarryPageContentDetailViewController: UIViewController {
    @IBOutlet weak var detailTextView: UITextView!
    var detailTextContent:NSMutableAttributedString!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(
            red:63.0/255.0,
            green:108.0/255.0,
            blue:175.0/255.0,
            alpha:1.0)
        navBarColor.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        detailTextView.attributedText = detailTextContent
        
        detailTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        detailTextView.layer.borderWidth = 1.0
        detailTextView.layer.cornerRadius = 5
        detailTextView.backgroundColor = UIColor.clearColor()
        detailTextView.textColor = UIColor.blackColor()//UIColor(red: 171/255, green: 49/255, blue: 30/255, alpha: 1.0)
        // Do any additional setup after loading the view.
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
