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
    var wwfList = [QuarryModelObject]()
    var havinagAMeetingList = [QuarryModelObject]()
    var buildingaRelationship = [QuarryModelObject]()
    var sellingToClient = [QuarryModelObject]()
    var quarryItemsDict : [String :[QuarryModelObject]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.collectionView?.collectionViewLayout = layout
        self.collectionView?.delegate = self;
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        self.dashBoardItems = ["WWF","Have a meeting","Build a relation","Sell to the client","Write a proposal","Coming soon"]
        self.imageArry = ["wwf.png","meeting.png","buildingrelationship.png","sellingtoclient.png","proposal.png","comingsoon1.png"];
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        navBarColor.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        // WWF
        wwfList.append(QuarryModelObject(topicTitle: "WWF", topicImageName: "piuc.png", topicDetailText:"What We Find")!)
        quarryItemsDict[dashBoardItems[0]] = wwfList
        // Having a client
        
        havinagAMeetingList.append(QuarryModelObject(topicTitle: "Have a meeting", topicImageName: "piuc.png", topicDetailText:"Scripted play")!)
        
        quarryItemsDict[dashBoardItems[1]] = havinagAMeetingList
        // Building a Relationship
        
        //ROVA -   Building Client relationship
        
        buildingaRelationship.append(QuarryModelObject(topicTitle: "Build a relation", topicImageName: "rova.png", topicDetailText:"ROVA")!)
        //PKAE
        
        buildingaRelationship.append(QuarryModelObject(topicTitle: "Build a relation", topicImageName: "pkae.png", topicDetailText:"Building Credibility")!)
        quarryItemsDict[dashBoardItems[2]] = buildingaRelationship
        
        // Selling to Client
        //Desired Business Results
        sellingToClient.append(QuarryModelObject(topicTitle: "Sell to the client", topicImageName: "dbr.png", topicDetailText:"Why do they buy")!)
        //Desired Personal Gains
        
        //sellingToClient.append(QuarryModelObject(topicTitle: "Selling to the client", topicImageName: "dpg.png", topicDetailText:"DPG")!)
        quarryItemsDict[dashBoardItems[3]] = sellingToClient
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
     
        //self.collectionView!.addSubview(imageView)
       // self.collectionView!.sendSubviewToBack(imageView)
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
        
        let image : UIImage = UIImage(named: imageArry[indexPath.row])!
        cell.bgImage.image = image
        cell.bgImage.clipsToBounds = true
        cell.bgImage.contentMode = .ScaleToFill
        // Configure the cell
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.textLabel.text = dashBoardItems[indexPath.row]
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
        if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3) {
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
