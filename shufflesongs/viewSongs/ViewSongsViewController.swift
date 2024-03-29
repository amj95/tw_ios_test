//
//  ViewSongsViewController.swift
//  shufflesongs
//
//  Created by antonio marcos on 16/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import UIKit
class ViewSongsViewController : UITableViewController, ViewSongsDelegate {
    
    var tableData: [Song] = []
    var indicator = UIActivityIndicatorView()
    private let mViewSongsPresenter = ViewSongsPresenter(getSongs : GetSongs(songsRepository: SongsRepository.getInstance(remoteDataSource: SongsRemoteDataSource.getInstance())))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityIndicator()
        setLoadingIndicator()
        
        mViewSongsPresenter.setViewDelegate(viewSongsDelegate: self)
        mViewSongsPresenter.getSongs()
    }
    
    @IBAction func shuffleSongs(_ sender: Any) {
        mViewSongsPresenter.actionShuffleSongs()
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        SongTableViewCell
        let song = tableData[indexPath.row]
        cell.prepare(with: song)
        return cell
    }
    
}

extension ViewSongsViewController{
    func displaySongs(songs: [Song]) {
        removeLoadingIndicator()
        tableData = songs
        self.tableView.reloadData()
    }
}

