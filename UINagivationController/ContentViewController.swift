//
//  ContentViewController.swift
//  UINagivationController
//
//  Created by 🍋 on 16/7/20.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    fileprivate var content:String!
    @IBOutlet weak var contentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        contentTextView.text = content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setContent(_ str:String) {
        self.content = str
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
