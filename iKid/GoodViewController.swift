//
//  GoodViewController.swift
//  iKid
//
//  Created by Quan Nguyen on 4/25/17.
//  Copyright © 2017 Quan Nguyen. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        switchView(self);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        firstViewController = nil;
        secondViewController = nil;
    }
    var firstViewController : GoodFirstViewController!
    var secondViewController : GoodSecondViewController!
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Fifth")
                as! GoodFirstViewController
        }
    }
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Sixth")
                as! GoodSecondViewController
        }
    }

    @IBAction func switchView(_ sender: Any) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(secondViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
