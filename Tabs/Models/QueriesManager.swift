//
//  QueriesManager.swift
//  Tabs
//
//  Created by Schloesser, Sebastian on 7/21/15.
//  Copyright (c) 2015 Schloesser, Sebastian. All rights reserved.
//

import UIKit

public class QueriesManager: NSObject {

    class func loadTabsForUser(user: PFUser) -> [PFObject] {
        var query = PFQuery(className:"TabRelation")
        query.whereKey("user", equalTo: user)
        var tabs: [PFObject] = []
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let objects = objects {

                for o in objects {
                    let tab = o.objectForKey("tab") as? PFObject
                    tabs.append(tab!)
                }
            }
        }
        return tabs
    }



    
}
