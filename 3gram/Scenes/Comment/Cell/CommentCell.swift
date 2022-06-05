//
//  CommentCell.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 3.06.2022.
//

import UIKit

class CommentCell: UITableViewCell {
// MARK: - UI Elements
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
// MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
// MARK: - Functions
    
    //Configure Function
    private func configure() {
        drawDesign()
    }
    // Design Function
    private func drawDesign() {
        nameLabel.numberOfLines = 0
        
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .left
    }
    // Cell Function
    func fetchComments(model: CommentModel) {
        nameLabel.text = model.name
        commentLabel.text = model.body
        timeLabel.text = "\(Int.random(in: 0..<60)) min"
    }
    
}
