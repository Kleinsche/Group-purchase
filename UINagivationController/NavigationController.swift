//
//  NavigationControllerTableViewController.swift
//  UINagivationController
//
//  Created by 🍋 on 16/7/20.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class NavigationControllerTableViewController: UITableViewController {

    fileprivate var dataSource:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = NSArray(contentsOf: Bundle.main.url(forResource: "foodList", withExtension: "plist")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let dictionary = dataSource.object(at: (indexPath as NSIndexPath).row)
        
        let food = FoodModel(dict: dictionary as! [String : AnyObject])
        
        let image = cell.viewWithTag(1) as! UIImageView
        image.image = UIImage(named: food.pic)

        let name = cell.viewWithTag(2)  as!  UILabel
        name.text = "菜名:\(food.value(forKey: "name") as! String)"
        
        let price = cell.viewWithTag(3)  as!  UILabel
        price.text = "价格:\(food.value(forKey: "price") as! String)"
        
        let buy = cell.viewWithTag(4)  as!  UILabel
        buy.text = "已售:\(food.value(forKey: "buy") as! String)"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictionary = dataSource.object(at: (indexPath as NSIndexPath).row) as! NSDictionary
        let food = FoodModel(dict: dictionary as! [String : AnyObject])
        let contentVc = storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentViewController
        contentVc.setContent(food.value(forKey: "content") as! String)
        navigationController?.pushViewController(contentVc, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
