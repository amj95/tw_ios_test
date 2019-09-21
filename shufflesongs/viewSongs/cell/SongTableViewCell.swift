//
//  SongTableViewCell.swift
//  shufflesongs
//
//  Created by antonio marcos on 21/09/2019.
//  Copyright © 2019 tw. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var iv_bullet: UIImageView!
    @IBOutlet weak var tv_music: UILabel!
    @IBOutlet weak var tv_artist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with song: Song){
        tv_music.text = song.trackName
        tv_artist.text = song.artistName
    }
}
