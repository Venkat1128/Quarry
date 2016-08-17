//
//  QuarryPageContentDetailViewController.swift
//  Quarry
//
//  Created by Venkat on 23/05/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit

class QuarryPageContentDetailViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    var detailTextContent:NSMutableAttributedString!
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        detailTextView.attributedText = detailTextContent
        self.detailTextView.delegate = self
        detailTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        detailTextView.layer.borderWidth = 1.0
        detailTextView.layer.cornerRadius = 10
        detailTextView.backgroundColor = UIColor.clearColor()
        
       // detailTextView.textColor = UIColor.blackColor()//UIColor(red: 171/255, green: 49/255, blue: 30/255, alpha: 1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        detailTextView.setContentOffset(CGPointZero, animated: false)
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
