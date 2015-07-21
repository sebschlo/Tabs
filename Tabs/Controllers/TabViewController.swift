//
//  TabViewController.swift
//  Tabs
//
//  Created by Schloesser, Sebastian on 7/20/15.
//  Copyright © 2015 Schloesser, Sebastian. All rights reserved.
//

import UIKit

class TabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var tab: PFObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.reloadData()
    }



    // MARK: - Table View Delegate Methods

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
