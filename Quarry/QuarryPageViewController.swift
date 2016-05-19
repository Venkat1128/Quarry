//
//  QuarryPageViewController.swift
//  Quarry
//
//  Created by Venkat on 19/05/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit
class QuarryPageViewController: UIViewController ,UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    
    let pageTitles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    var images = ["long3.png","long4.png","long1.png","long2.png"]
    var count = 0
    
    var pagevIewController = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    func viewControllerAtIndex(index : Int) -> UIViewController? {
    if((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
    return nil
    }
    let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! QuarryPageContentViewController
    
    pageContentViewController.imageName = self.images[index]
    pageContentViewController.titleText = self.pageTitles[index]
    pageContentViewController.pageIndex = index
    return pageContentViewController
    }
   
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        pageTitles.count
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        0
    }
}
