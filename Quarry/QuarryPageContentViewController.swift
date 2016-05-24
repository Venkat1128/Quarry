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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topicpptImage.image = UIImage(named: imageName)
        self.titleLabel.text = self.titleText
        self.titleLabel.alpha = 0.1
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.titleLabel.alpha = 1.0
        })
        
        imageTapgeature.addTarget(self, action: "tappedView")
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
    func tappedView(){
        
    }
}
