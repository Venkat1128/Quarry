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
    override func viewDidLoad() {
        super.viewDidLoad()
detailTextView.text = "";
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
