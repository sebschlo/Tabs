//
//  MainViewController.swift
//  Tabs
//
//  Created by Schloesser, Sebastian on 7/20/15.
//  Copyright © 2015 Schloesser, Sebastian. All rights reserved.
//

import UIKit
//import Parse

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PFLogInViewControllerDelegate {

    let reuseIdentifier = "cvCell"
    var collectionView: UICollectionView!
    var tabs: [PFObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tabs"
        configureNavigationBar()
        configureCollectionView()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Log In
        if (PFUser.currentUser() == nil) {
            logIn()
        } else {
            tabs = QueriesManager.loadTabsForUser(PFUser.currentUser()!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureNavigationBar () {
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barTintColor = UIColor.tab_orangeColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Rewind, target: self, action: "logOut")
    }

    func configureCollectionView () {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
        let size = (view.bounds.width - 60)/2
        layout.itemSize = CGSize(width: size, height: size)
        let navHeight = navigationController?.navigationBar.frame.size.height ?? 0
        let frame = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height - navHeight + 20)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = UIColor.tab_grayColor()

        view.addSubview(collectionView)
    }


    // MARK: - Collection View
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count + 1
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        cell.backgroundColor = UIColor.tab_lightGrayColor()
        if indexPath.item == 0 {
            let boxWidth = (view.bounds.width - 60)/2
            let barWidth = boxWidth * 0.05
            let vert = UIView(frame: CGRectMake((boxWidth-barWidth)/2, 10, barWidth, boxWidth-20))
            let horz = UIView(frame: CGRectMake(10, (boxWidth-barWidth)/2, boxWidth-20, barWidth))
            vert.backgroundColor = UIColor.tab_lightPinkColor()
            horz.backgroundColor = UIColor.tab_lightPinkColor()
            cell.addSubview(vert)
            cell.addSubview(horz)
        } else {
            // Configure for tab
        }
        return cell
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.item == 0 {
            let newTabVC = AddTabViewController()
            navigationController?.pushViewController(newTabVC, animated: true)
        } else {
            let tabVC = TabViewController()
            tabVC.tab = tabs[indexPath.item]
            navigationController?.pushViewController(tabVC, animated: true)
        }
    }

    // MARK: - LogIn Delegate Methods

    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        return true
    }

    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            // something
        })
    }

    func logIn () {
        // Create the login view controller
        let loginVC = PFLogInViewController()
        loginVC.delegate = self
        loginVC.fields = (PFLogInFields.UsernameAndPassword
            | PFLogInFields.LogInButton
            | PFLogInFields.SignUpButton
            | PFLogInFields.PasswordForgotten)
        presentViewController(loginVC, animated: true, completion: nil)
    }

    func logOut () {
        PFUser.logOut()
        logIn()
    }

}
