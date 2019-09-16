//
//  ViewSongsViewController.swift
//  shufflesongs
//
//  Created by antonio marcos on 16/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import UIKit
class ViewSongsViewController : UITableViewController, ViewSongsDelegate {
    
    var indicator = UIActivityIndicatorView()
    private let mViewSongsPresenter = ViewSongsPresenter(getSongs : GetSongs())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityIndicator()
        setLoadingIndicator()
        
        mViewSongsPresenter.setViewDelegate(viewSongsDelegate: self)
        mViewSongsPresenter.getSongs()
    }
    
    @IBAction func shuffleSongs(_ sender: Any) {
        print("button clicked !")
    }
    
    func configureActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    func setLoadingIndicator(){
        indicator.startAnimating()
        indicator.color = .white
    }
    
    func removeLoadingIndicator(){
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }
}

extension ViewSongsViewController{
    func displaySongs() {
        removeLoadingIndicator()
        print("rodou")
    }
}

