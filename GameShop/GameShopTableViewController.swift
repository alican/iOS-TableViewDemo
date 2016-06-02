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
    
    var games = [Game]()
    
    
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
        
        //let entries = dict as! [String:[String]]
        
        gameNames = dict!.objectForKey("GameName") as! [String]
        covers = dict!.objectForKey("Cover") as! [String]
        systems = dict!.objectForKey("System") as! [String]
        prices = dict!.objectForKey("Price") as! [String]
        

        for (index, name) in gameNames.enumerate(){
            let game = Game(title: name, cover: covers[index], system: systems[index], price: prices[index]);
            games.append(game)
        }
    
    }
    
    
    
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
        
        let game = games[indexPath.row]
        
        cell.gameNameLabel?.text = game.title
        cell.productImage?.image = UIImage(named: game.cover)
        cell.productImage?.contentMode = .ScaleAspectFit
        let price = game.price;
        cell.priceLabel?.text = "€ \(price)"
        cell.consoleLabel?.text = game.system
        
        if game.selected{
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        games[indexPath.row].selected = !games[indexPath.row].selected
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)!

        if games[indexPath.row].selected{
            selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            selectedCell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        
        //selectedCell.backgroundColor = UIColor.whiteColor()
    
    }

}

