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
        self.imageArry = ["meeting.png","challenge.png","proposal.png","meeting.png","proposal.png","challenge.png"];
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(
            red:63.0/255.0,
            green:108.0/255.0,
            blue:175.0/255.0,
            alpha:1.0)
        navBarColor.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()

        havinagAMeetingList.append(QuarryModelObject(topicTitle: "PREPARE", topicImageName: "prepare.png", topicDetailText: "Research\nPersonal biography\nOrganisation structure\nClient strategic objectives\nDecision network\nCompetitor presence\nPain points\nHypotheses on pain points\nScript the meeting\nIdentify the what we finds\nUnderstand the time agreement\nSecretary’s name.")!)
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "INTRODUCTION", topicImageName: "introduction.png", topicDetailText: "Ice breaker to relax client and be human Agree purpose, agenda and time commitment\nPersonal introduction to start the peer relationship\nOutline our focus on their issues, confidentially\nFirm introduction and the people we work with\nRecognise our capability is broader than experienced\nPre-empt objections with content and WWFs.")!)
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "UNDERSTANDING", topicImageName: "understanding.png", topicDetailText: "Search for the pain – and the emotion / owner\nHighlight need for acceleration / mobilisation\nShare 2-3 what we finds around the issue\nIntroduce how we work collaboratively\nUse repeated open questions to understand\nListen, listen, listen & probe for completeness\nDemonstrate empathy & understand personal stak.")!)
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "CREDIBILITY", topicImageName: "credibility.png", topicDetailText: "Where we have done it before, delivery results\nRelated issues to show true understanding\nUse their language to show what we did and not how\nManage the emotional and political issues\nConfirm issues and agree next steps\nSchedule next meeting with homework for them\nTake the next steps yourself for ownership.")!)
        quarryItemsDict[dashBoardItems[0]] = havinagAMeetingList
        
        
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
        pageCatTiteText = dashBoardItems[indexPath.row]
        self.performSegueWithIdentifier("quarryPageSegue", sender: reuseIdentifier)
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
