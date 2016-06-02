//
//  GameShopTableViewController.swift
//  GameShop
//
//  Created by Alican Toprak on 31.05.16.
//  Copyright © 2016 Alican Toprak. All rights reserved.
//

import UIKit

class GameShopTableViewController: UITableViewController {
    
    @IBOutlet var GameTableView: UITableView!
    
    var gameNames = [String]()
    var covers = [String]()
    var systems = [String]()
    var prices = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        let nib = UINib(nibName: "gameEntryCell", bundle: nil)
        
        GameTableView.registerNib(nib, forCellReuseIdentifier: "GameCell")
        
        
        let path = NSBundle.mainBundle().pathForResource("Data", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        gameNames = dict!.objectForKey("GameName") as! [String]
        covers = dict!.objectForKey("Cover") as! [String]
        systems = dict!.objectForKey("System") as! [String]
        prices = dict!.objectForKey("Price") as! [String]

    
    }
    
    // asd‚
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameNames.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell:GameEntryCellTableViewCell = self.GameTableView.dequeueReusableCellWithIdentifier("GameCell") as! GameEntryCellTableViewCell
        
        cell.gameNameLabel?.text = gameNames[indexPath.row]
        cell.productImage?.image = UIImage(named: covers[indexPath.row])
        cell.productImage?.contentMode = .ScaleAspectFit
        let price = prices[indexPath.row];
        cell.priceLabel?.text = "€ \(price)"
        cell.consoleLabel?.text = systems[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.backgroundColor = UIColor.whiteColor()
        
    }

}

