//
//  QuarryPageViewController.swift
//  Quarry
//
//  Created by Venkat on 19/05/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit
class QuarryPageViewController: UIViewController , UIPageViewControllerDataSource {
    
    var count = 0
    var catTitleText : String?
    var numberOfPages : [QuarryModelObject] = []
    var pageViewController = UIPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = catTitleText
        reset()
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
    @IBAction func start(sender: AnyObject) {
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    
    func reset() {
        /* Getting the page View controller */
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        /* We are substracting 30 because we have a start again button whose height is 30*/
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - 42)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    func viewControllerAtIndex(index : Int) -> QuarryPageContentViewController? {
        if((self.numberOfPages.count == 0) || (index >= self.numberOfPages.count)) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! QuarryPageContentViewController
        
        pageContentViewController.imageName = self.numberOfPages[index].topicImageName
        pageContentViewController.titleText = self.numberOfPages[index].topicTitle
        pageContentViewController.pageIndex = index
        pageContentViewController.titleLabelText = self.numberOfPages[index].topicDetailText
        return pageContentViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index  = (viewController as! QuarryPageContentViewController).pageIndex
        if(index == 0){
            return nil
        }
        index = index!-1
        return self.viewControllerAtIndex(index!)
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index  = (viewController as! QuarryPageContentViewController).pageIndex
        index = index! + 1
        if(index == self.numberOfPages.count){
            return nil
        }
        return self.viewControllerAtIndex(index!)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return numberOfPages.count
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
