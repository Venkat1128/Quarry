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
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        navBarColor.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
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
    @IBAction func start(_ sender: AnyObject) {
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
    
    func reset() {
        /* Getting the page View controller */
        pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        /* We are substracting 30 because we have a start again button whose height is 30*/
        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 42)
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
    }
    
    func viewControllerAtIndex(_ index : Int) -> QuarryPageContentViewController? {
        if((self.numberOfPages.count == 0) || (index >= self.numberOfPages.count)) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! QuarryPageContentViewController
        
        pageContentViewController.imageName = self.numberOfPages[index].topicImageName
        pageContentViewController.titleText = self.numberOfPages[index].topicTitle
        pageContentViewController.pageIndex = index
        pageContentViewController.titleLabelText = self.numberOfPages[index].topicDetailText
        return pageContentViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index  = (viewController as! QuarryPageContentViewController).pageIndex
        if(index == 0){
            return nil
        }
        index = index!-1
        return self.viewControllerAtIndex(index!)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index  = (viewController as! QuarryPageContentViewController).pageIndex
        index = index! + 1
        if(index == self.numberOfPages.count){
            return nil
        }
        return self.viewControllerAtIndex(index!)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        if numberOfPages.count > 1 {
            return numberOfPages.count
        }else{
            return 0
        }
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
