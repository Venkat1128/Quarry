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
    var sellingToClient = [QuarryModelObject]()
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
        self.dashBoardItems = ["Have a meeting","Build a relation","Selling to the client","Write a proposal","Coming soon","Coming soon"]
        self.imageArry = ["buildingrelationship.png","meeting.png","sellingtoclient.png","proposal.png","comingsoon1.png","comingsoon2.png"];
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        navBarColor.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
                
        // Having a client
        
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "Have a meeting", topicImageName: "piuc.png", topicDetailText:"Scripted play")!)
   
        quarryItemsDict[dashBoardItems[0]] = havinagAMeetingList
        // Building a Relationship
        
        //ROVA -   Building Client relationship
        
        buildingaRelationship.append(QuarryModelObject(topicTitle: "Build a relation", topicImageName: "rova.png", topicDetailText:"ROVA")!)
        //PKAE 
        
        buildingaRelationship.append(QuarryModelObject(topicTitle: "Build a relation", topicImageName: "pkae.png", topicDetailText:"Building Credibility")!)
        quarryItemsDict[dashBoardItems[1]] = buildingaRelationship
        
        // Selling to Client
        //Desired Business Results
         sellingToClient.append(QuarryModelObject(topicTitle: "Selling to the client", topicImageName: "dbr.png", topicDetailText:"Why do they buy")!)
        //Desired Personal Gains
        
        //sellingToClient.append(QuarryModelObject(topicTitle: "Selling to the client", topicImageName: "dpg.png", topicDetailText:"DPG")!)
        quarryItemsDict[dashBoardItems[2]] = sellingToClient
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
        if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2) {
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
