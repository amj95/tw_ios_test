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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with song: Song){
        tv_music.text = song.trackName
        tv_artist.text = song.artistName
        iv_bullet.image = UIImage(named: "logo")
        DispatchQueue.global().async { [weak self] in
            if let urlPath = song.artworkURL{
                if let data = try? Data(contentsOf: URL(string: urlPath)!){
                    if let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            self?.iv_bullet.image = image
                        }
                    }
                }
            }
        }
    }
}
