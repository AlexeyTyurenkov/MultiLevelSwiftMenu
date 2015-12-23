//
//  MenuViewController.swift
//  MultiLevelMenu
//
//  Created by Aleksey Tyurenkov on 12/23/15.
//  Copyright © 2015 com.ovt. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController
{
    var menuList:MenuList = MenuList.defaultMenu()
    override func viewDidLoad() {
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuControllerCell")
        if let cell = cell as? MenuCell
        {
            cell.configure(option: menuList[indexPath])
        }
        return cell!
    }
    
    
}

class MenuList
{
    private var menu: [MenuOption] = []
    
    var count: Int
    {
        get {
            return menu.count
        }
    }
    
    internal static func defaultMenu() -> MenuList
    {
        let result = MenuList()
        result.menu = [MenuOption(text: "top"),MenuOption(text: "next"), MenuOption(text: "last")]
        return result
    }
    
    subscript(indexPath: NSIndexPath) -> MenuOption
    {
        return menu[indexPath.row]
    }
    

}


class MenuOption
{
    private let _title:String
    
    internal var title: String
    {
        get {
            return _title
        }
    }
    
    init(text:String)
    {
        _title = text
    }
    
    
}


class MenuCell:UITableViewCell
{
    func configure(option option:MenuOption)
    {
        self.textLabel?.text = option.title
    }
}

