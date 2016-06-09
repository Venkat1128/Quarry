//
//  QuarryCollectionViewController.swift
//  Quarry
//
//  Created by Venkat on 30/04/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit
private let reuseIdentifier = "QuarryCustomCell"

class QuarryCollectionViewController: UICollectionViewController {
    var dashBoardItems = [String]()
    var imageArry = [String]()
    var pageCatTiteText : String = ""
    var havinagAMeetingList = [QuarryModelObject]()
    var buildingaRelationship = [QuarryModelObject]()
    var quarryItemsDict : [String :[QuarryModelObject]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.collectionView?.collectionViewLayout = layout
        self.collectionView?.delegate = self;
        
        // Do any additional setup after loading the view.
        self.dashBoardItems = ["Having a meeting ?","Building the relationship ?","Writing a proposal ?","Selling to the client ?","Coming soon ?","Coming soon ?"]
        self.imageArry = ["meeting.png","buildingrelationship.png","proposal.png","sellingtoclient.png","comingsoon1.png","comingsoon2.png"];
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(
            red:63.0/255.0,
            green:108.0/255.0,
            blue:175.0/255.0,
            alpha:1.0)
        navBarColor.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let titleAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline), NSForegroundColorAttributeName: UIColor.blackColor()]
       
       
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "PREPARE", topicImageName: "prepare.png", topicDetailText:NSMutableAttributedString(string: "• Research\n\n• Personal biography\n\n• Organisation structure\n\n• Client strategic objectives\n\n• Decision network\n\n• Competitor presence\n\n• Pain points\n\n• Hypotheses on pain points\n\n• Script the meeting\n\n• Identify the what we finds\n\n• Understand the time agreement\n\n• Secretary’s name.", attributes: titleAttributes) )!)
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "INTRODUCTION", topicImageName: "introduction.png", topicDetailText: NSMutableAttributedString(string:"• Ice breaker to relax client and be human Agree purpose, agenda and time commitment\n\n• Personal introduction to start the peer relationship\n\n• Outline our focus on their issues, confidentially\n\n• Firm introduction and the people we work with\n\n• Recognise our capability is broader than experienced\n\n• Pre-empt objections with content and WWFs.", attributes: titleAttributes) )!)
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "UNDERSTANDING", topicImageName: "understanding.png", topicDetailText: NSMutableAttributedString(string:"• Search for the pain – and the emotion / owner\n\n• Highlight need for acceleration / mobilisation\n\n• Share 2-3 what we finds around the issue\n\n• Introduce how we work collaboratively\n\n• Use repeated open questions to understand\n\n• Listen, listen, listen & probe for completeness\n\n• Demonstrate empathy & understand personal stak.", attributes: titleAttributes) )!)
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "CREDIBILITY", topicImageName: "credibility.png", topicDetailText: NSMutableAttributedString(string:"• Where we have done it before, delivery results\n\n• Related issues to show true understanding\n\n• Use their language to show what we did and not how\n\n• Manage the emotional and political issues\n\n• Confirm issues and agree next steps\n\n• Schedule next meeting with homework for them\n\n• Take the next steps yourself for ownership.", attributes: titleAttributes) )!)
        quarryItemsDict[dashBoardItems[0]] = havinagAMeetingList
        let myAttributedString = NSMutableAttributedString()
        myAttributedString.appendAttributedString(NSAttributedString(string:"• Relationship: ensure you build upon your relationship with the client at every opportunity, show that you care through getting to know them.\n\n• Opportunity: this is a business relationship, so opportunities to work together should always be on the agenda, so look out for them and take note.\n\n• Value: always add value to the client on every encounter, however small. The client should leave the encounter richer.\n\n• Agreement: ensure that you make agreements however small or trivial and always follow through on the agreements.", attributes: titleAttributes))
        buildingaRelationship.append(QuarryModelObject(topicTitle: "ROVA", topicImageName: "rova.png", topicDetailText:myAttributedString)!)
        
        quarryItemsDict[dashBoardItems[1]] = buildingaRelationship
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
        if segue.identifier == "quarryPageSegue" {
            let detailsVC = segue.destinationViewController as! QuarryPageViewController
            detailsVC.catTitleText = pageCatTiteText
            detailsVC.numberOfPages = quarryItemsDict[detailsVC.catTitleText!]!
        }
     }
 
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dashBoardItems.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! QuarryCollectionViewCell
       /* cell.backgroundColor = UIColor(
            red:63.0/255.0,
            green:108.0/255.0,
            blue:175.0/255.0,
            alpha:1.0)*/
        cell.textLabel.text = dashBoardItems[indexPath.row]
        cell.textLabel.textColor = UIColor.blackColor()
        
              
        let image : UIImage = UIImage(named: imageArry[indexPath.row])!
        cell.bgImage.image = image
        // Configure the cell
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //device screen size
        let width = UIScreen.mainScreen().bounds.size.width
        let hight = UIScreen.mainScreen().bounds.size.height
        //calculation of cell size
        return CGSize(width: ((width / 2) - 15)   , height: ((hight/3)-35))
    }
    // MARK: UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.grayColor()
        if (indexPath.row == 0 || indexPath.row == 1) {
            pageCatTiteText = dashBoardItems[indexPath.row]
            self.performSegueWithIdentifier("quarryPageSegue", sender: reuseIdentifier)
        }else{
            // create the alert
            let alert = UIAlertController(title: "Quarry", message: "In Progress!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        }
     
    }
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
}
