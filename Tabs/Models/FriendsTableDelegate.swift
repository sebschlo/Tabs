//
//  FriendsTableDelegate.swift
//  Tabs
//
//  Created by Schloesser, Sebastian on 7/21/15.
//  Copyright (c) 2015 Schloesser, Sebastian. All rights reserved.
//

import UIKit

class FriendsTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    let identifier = "friendTableCell"
    let user: PFUser!
    let selectAction: (PFUser) -> Void
    var friends: [PFUser] = []


    init(user: PFUser, selectAction: (PFUser) -> Void) {
        self.user = user
        self.selectAction = selectAction
        friends = QueriesManager.loadFriendsForUser(user)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! UITableViewCell
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.objectForKey("username") as? String
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectAction(friends[indexPath.row])
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
}
