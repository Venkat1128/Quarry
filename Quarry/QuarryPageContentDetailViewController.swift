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
    @IBOutlet weak var detailTextTitleLabel: UILabel!
    var detailTextContent:NSMutableAttributedString!
    var detailTitleText:String!
    override func viewDidLoad() {
        super.viewDidLoad()
     // assignbackground()
        detailTextView.attributedText = detailTextContent
        self.detailTextView.delegate = self
        //detailTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
       // detailTextView.layer.borderWidth = 1.0
        //detailTextView.layer.cornerRadius = 10
        self.detailTextTitleLabel.text = self.detailTitleText;
        detailTextView.backgroundColor = UIColor(red: 31/255, green:68/255, blue: 107/255, alpha: 0.8)
        detailTextView.textColor = UIColor.white
       // detailTextView.textColor = UIColor.blackColor()//UIColor(red: 171/255, green: 49/255, blue: 30/255, alpha: 1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        detailTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    func assignbackground(){
        let background = UIImage(named: "quarry_bg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        detailTextView.addSubview(imageView)
        detailTextView.sendSubview(toBack: imageView)
       // view.addSubview(imageView)
       // self.view.sendSubviewToBack(imageView)
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
