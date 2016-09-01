//
//  QuarryDetailViewController.swift
//  Quarry
//
//  Created by Venkat on 10/08/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit

class QuarryDetailViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    var titleLabelText : String!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
          
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        let titleAttributes = [NSFontAttributeName:UIFont(name: "HelveticaNeue-Bold", size: 17.0)!, NSForegroundColorAttributeName:UIColor.yellowColor()]
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Center
        
        let centerAttributes = [NSFontAttributeName:UIFont(name: "HelveticaNeue-Bold", size: 17.0)!, NSForegroundColorAttributeName:UIColor.yellowColor(),NSParagraphStyleAttributeName:paragraphStyle]
        
        let bodyAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 17.0)!, NSForegroundColorAttributeName: UIColor.yellowColor()]
        
        var controllerArray : [UIViewController] = []
        var parameters : [CAPSPageMenuOption]?
        // Customize menu (Optional)
        parameters = [
            .ScrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(90),
            .CenterMenuItems(true)
        ]
        
        
        if self.title == "Have a meeting" {
            parameters = [
                .ScrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
                .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
                .SelectionIndicatorColor(UIColor.orangeColor()),
                .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
                .MenuItemFont(UIFont(name: "HelveticaNeue", size: 14.0)!),
                .MenuHeight(40.0),
                .MenuItemWidth(120),
                .CenterMenuItems(true)
            ]
            let controller1 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
            
            let myAttributedMeetingString1 = NSMutableAttributedString()
            
            myAttributedMeetingString1.appendAttributedString(NSAttributedString(string:"\n• Research\n\n• Personal biography\n\n• Organisation structure\n\n• Client strategic objectives\n\n• Decision network\n\n• Competitor presence\n\n• Pain points\n\n• Hypotheses on pain points\n\n• Script the meeting\n\n• Identify the what we finds\n\n• Understand the time agreement\n\n• Secretary’s name.\n\n", attributes: bodyAttributes))
            controller1.title = "PREPARE"
            controller1.detailTitleText = "PREPARE"
            controller1.detailTextContent = myAttributedMeetingString1;
            controllerArray.append(controller1)
            
            let controller2 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
            let myAttributedMeetingString2 = NSMutableAttributedString()
            myAttributedMeetingString2.appendAttributedString(NSAttributedString(string:"\n• Ice breaker to relax client and be human Agree purpose, agenda and time commitment\n\n• Personal introduction to start the peer relationship\n\n• Outline our focus on their issues, confidentially\n\n• Firm introduction and the people we work with\n\n• Recognise our capability is broader than experienced\n\n• Pre-empt objections with content and WWFs.\n\n",attributes:bodyAttributes ))
            controller2.title = "INTRODUCTION"
            controller2.detailTitleText = "INTRODUCTION"
            controller2.detailTextContent = myAttributedMeetingString2
            controllerArray.append(controller2)
            
            let controller3 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
            let myAttributedMeetingString3 = NSMutableAttributedString()
            
            myAttributedMeetingString3.appendAttributedString(NSAttributedString(string:"\n• Search for the pain – and the emotion / owner\n\n• Highlight need for acceleration / mobilisation\n\n• Share 2-3 what we finds around the issue\n\n• Introduce how we work collaboratively\n\n• Use repeated open questions to understand\n\n• Listen, listen, listen & probe for completeness\n\n• Demonstrate empathy & understand personal stak.\n\n",attributes:bodyAttributes ))
            controller3.title = "UNDERSTANDING"
            controller3.detailTitleText = "UNDERSTANDING"
            controller3.detailTextContent = myAttributedMeetingString3
            controllerArray.append(controller3)
            
            let controller4 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
            let myAttributedMeetingString4 = NSMutableAttributedString()
            myAttributedMeetingString4.appendAttributedString(NSAttributedString(string:"\n• Where we have done it before, delivery results\n\n• Related issues to show true understanding\n\n• Use their language to show what we did and not how\n\n• Manage the emotional and political issues\n\n• Confirm issues and agree next steps\n\n• Schedule next meeting with homework for them\n\n• Take the next steps yourself for ownership.",attributes:bodyAttributes ))
            controller4.title = "CREDIBILITY"
            controller4.detailTitleText = "CREDIBILITY"
            controller4.detailTextContent = myAttributedMeetingString4
            controllerArray.append(controller4)
            
        }else if self.title == "Build a relation"{
            if self.titleLabelText == "ROVA" {
                
                let myAttributedROVAString = NSMutableAttributedString()
                //ROVA -   Building Client relationship
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"\nEvery encounter you have with your client should cover ALL of the four below:\n\n",attributes: titleAttributes))
                
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"Relationship: ",attributes:titleAttributes ))
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"Ensure you build upon your relationship with the client at every opportunity, show that you care through getting to know them.\n\n", attributes: bodyAttributes))
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"Opportunity: ",attributes:titleAttributes ))
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"This is a business relationship, so opportunities to work together should always be on the agenda, so look out for them and take note.\n\n",attributes:bodyAttributes ))
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"Value: ",attributes:titleAttributes ))
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"Always add value to the client on every encounter, however small. The client should leave the encounter richer.\n\n",attributes:bodyAttributes ))
                
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"Agreement: ",attributes:titleAttributes ))
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"Ensure that you make agreements however small or trivial and always follow through on the agreements.",attributes:bodyAttributes ))
                
                
                
                let controller1 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                
                controller1.title = self.titleLabelText
                controller1.detailTextContent = myAttributedROVAString;
                controllerArray.append(controller1)
                
                
            }else if self.titleLabelText == "Building Credibility" {
                let controller1 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                
                let myAttributedMeetingString1 = NSMutableAttributedString()
                
                myAttributedMeetingString1.appendAttributedString(NSAttributedString(string:"\n• Organised & timely\n\n• Use their language and speech\n\n• Professional courtesy\n\n• Listening skills\n\n• Emotional rapport.\n\n", attributes: bodyAttributes))
                controller1.title = "Presentation"
                controller1.detailTitleText = "Presentation"
                controller1.detailTextContent = myAttributedMeetingString1;
                controllerArray.append(controller1)
                
                let controller2 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                let myAttributedMeetingString2 = NSMutableAttributedString()
                myAttributedMeetingString2.appendAttributedString(NSAttributedString(string:"\n• Business understanding\n\n• Approaches and insight\n\n• Technical expertise\n\n• Organisational knowledge\n\n",attributes:bodyAttributes ))
                controller2.title = "Knowledge"
                controller2.detailTitleText = "Knowledge"
                controller2.detailTextContent = myAttributedMeetingString2
                controllerArray.append(controller2)
                let controller3 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                let myAttributedMeetingString3 = NSMutableAttributedString()
                
                myAttributedMeetingString3.appendAttributedString(NSAttributedString(string:"\n• People you know\n\n• References given\n\n• Allies in the organisation\n\n",attributes:bodyAttributes ))
                controller3.title = "Associations"
                controller3.detailTitleText = "Associations"
                controller3.detailTextContent = myAttributedMeetingString3
                controllerArray.append(controller3)
                let controller4 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                let myAttributedMeetingString4 = NSMutableAttributedString()
                myAttributedMeetingString4.appendAttributedString(NSAttributedString(string:"\n• Personal track record\n\n• Relevant credentials\n\n• What you have done\n\n• Other credentials",attributes:bodyAttributes ))
                controller4.title = "Experience"
                controller4.detailTitleText = "Experience"
                controller4.detailTextContent = myAttributedMeetingString4
                controllerArray.append(controller4)
            }
            
        }else if self.title == "Sell to the client" {// Customize menu (Optional)
            parameters = [
                .ScrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
                .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
                .SelectionIndicatorColor(UIColor.orangeColor()),
                .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
                .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
                .MenuHeight(40.0),
                .MenuItemWidth(150),
                .CenterMenuItems(true)
            ]
            
            if self.titleLabelText == "What We Find"{
                
                let myAttributedROVAString = NSMutableAttributedString()
                //ROVA -   Building Client relationship
                
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"\nTell the story: \n\n",attributes:titleAttributes ))
                myAttributedROVAString.appendAttributedString(NSAttributedString(string:"• When we worked with…\n\n• They were facing … challenge\n\n• They new that…\n\n• (We conducted a …)\n\n• What we found was …\n\n• We launched a programme to …\n\n• The impact/ benefit was …\n\n", attributes: bodyAttributes))
                
                let controller1 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                
                controller1.title = self.titleLabelText
                controller1.detailTextContent = myAttributedROVAString;
                controllerArray.append(controller1)
                
                
            }

            else if self.titleLabelText == "WHAT they buy" {
                let controller1 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                
                let myAttributedMeetingString1 = NSMutableAttributedString()
                
                
                myAttributedMeetingString1.appendAttributedString(NSAttributedString(string:"\n• Use external research\n\n• Directly relevant to their issue\n\n• Value based discussions\n\n• Measurable benefits and results\n\n• Financially attractive\n\n• Logical and rational structure\n\n• Focus on business improvement\n\n• Frame a solution to their problem\n", attributes: bodyAttributes))
                
                myAttributedMeetingString1.appendAttributedString(NSAttributedString(string:"\n\nWHAT they buy\n\n",attributes: centerAttributes))
                
                controller1.title = "Desired Business Results"
                controller1.detailTextContent = myAttributedMeetingString1;
                controllerArray.append(controller1)
            }else if self.titleLabelText == "WHY do they buy"{
                let controller2 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
                
                let myAttributedMeetingString2 = NSMutableAttributedString()
                
                
                myAttributedMeetingString2.appendAttributedString(NSAttributedString(string:"\n• Based on personal agenda\n\n• Make it memorable to them\n\n• Visualise the end with them in it\n\n• Unfreeze the individual from status quo\n\n• Show the journey and change\n\n• Never judge, deny or assume their emotions\n\n• Review: safety, affirmation, power, recognition, achievement, avoid\n", attributes: bodyAttributes))
                myAttributedMeetingString2.appendAttributedString(NSAttributedString(string:"\n\nWHY they buy\n\n",attributes: centerAttributes))
                controller2.title = "Desired Personal Gains"
                controller2.detailTextContent = myAttributedMeetingString2;
                controllerArray.append(controller2)
            }
            
           /* else{
            let controller2 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
            
            let myAttributedMeetingString1 = NSMutableAttributedString()
            
           
            myAttributedMeetingString1.appendAttributedString(NSAttributedString(string:"\n• Use external research\n\n• Directly relevant to their issue\n\n• Value based discussions\n\n• Measurable benefits and results\n\n• Financially attractive\n\n• Logical and rational structure\n\n• Focus on business improvement\n\n• Frame a solution to their problem\n", attributes: bodyAttributes))
            
            myAttributedMeetingString1.appendAttributedString(NSAttributedString(string:"\n\nWHAT they buy\n\n",attributes: centerAttributes))
            
            controller2.title = "Desired Business Results"
            controller2.detailTitleText = "Desired Business Results"
            controller2.detailTextContent = myAttributedMeetingString1;
            controllerArray.append(controller2)
            
            let controller3 = self.storyboard?.instantiateViewControllerWithIdentifier("QuarryPageContentDetailViewController") as! QuarryPageContentDetailViewController
            
            let myAttributedMeetingString2 = NSMutableAttributedString()
            
            
            myAttributedMeetingString2.appendAttributedString(NSAttributedString(string:"\n• Based on personal agenda\n\n• Make it memorable to them\n\n• Visualise the end with them in it\n\n• Unfreeze the individual from status quo\n\n• Show the journey and change\n\n• Never judge, deny or assume their emotions\n\n• Review: safety, affirmation, power, recognition, achievement, avoid\n", attributes: bodyAttributes))
             myAttributedMeetingString2.appendAttributedString(NSAttributedString(string:"\n\nWHY they buy\n\n",attributes: centerAttributes))
            controller3.title = "Desired Personal Gains"
            controller3.detailTitleText = "Desired Personal Gains"
            controller3.detailTextContent = myAttributedMeetingString2;
            controllerArray.append(controller3)
            }*/
            
            
        }
        // Initialize view controllers to display and place in array
        
        
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Container View Controller
    override func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
        return true
    }
    
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
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
