//
//  CommentCell.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 3.06.2022.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        nameLabel.numberOfLines = 0
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .left
    }
    func fetchComments(model: CommentModel) {
        nameLabel.text = model.name
        commentLabel.text = model.body
        timeLabel.text = "\(Int.random(in: 0..<60)) min"
    }
    
}
