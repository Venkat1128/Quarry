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
    @IBOutlet weak var detailTextlabel: UILabel!
    
    var pageIndex: Int?
    var titleText : String!
    var imageName : String!
    let imageTapgeature = UITapGestureRecognizer()
    var titleLabelText : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*self.topicpptImage.image = UIImage(named: imageName)
        self.topicpptImage.layer.borderColor = UIColor.brownColor().CGColor
        self.topicpptImage.layer.borderWidth = 2
        self.topicpptImage.layer.cornerRadius = 10*/
        self.titleLabel.text = self.titleLabelText
        if self.titleLabelText == "What We Find" {
            //
        }else if self.titleLabelText == "Scripted play"{
            self.detailTextlabel.text = "Client meetings can be managed to run like a scripted play"
        }
        else if self.titleLabelText == "ROVA"{
            //self.detailTextlabel.text = "Client meetings can be managed to run like a scripted play"
        }
        else if self.titleLabelText == "Building Credibility"{
            self.detailTextlabel.text = "Each way needs to be addressed over time, with the strongest credibility being built by delivery experience with that client"
        }
        else if self.titleLabelText == "What & Why do they buy"{
            self.detailTextlabel.text = "Determining people’s personal agendas will help you focus on getting them to actually buy"
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(QuarryPageContentViewController.tappedView))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
        //topicpptImage.userInteractionEnabled = true
        //assignbackground()
        self.view.backgroundColor = UIColor(red: 31/255, green:68/255, blue: 107/255, alpha: 0.8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func assignbackground(){
        let background = UIImage(named: "quarry_bg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
         view.addSubview(imageView)
         self.view.sendSubview(toBack: imageView)
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
      
        let detailViewPageMenu = self.storyboard?.instantiateViewController(withIdentifier: "QuarryDetailViewController") as! QuarryDetailViewController
        detailViewPageMenu.titleLabelText = titleLabelText
        detailViewPageMenu.title = self.titleText
        let navController = UINavigationController(rootViewController: detailViewPageMenu)
        navController.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
        detailViewPageMenu.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,target: self,action: #selector(dismissView))
        DispatchQueue.main.async(execute: {
            self.present(navController, animated: true, completion: nil)
        })
    }
    func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
}
