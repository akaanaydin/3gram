//
//  CollectionCell.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 3.06.2022.
//

import UIKit
import Kingfisher

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
            
    private var randomImageUrl = "https://picsum.photos/200"
    
    private var viewModel: ViewModelProtocol = HomeViewModel(service: Service())
    
    var cellResult = [PhotoModel]()

    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.delegate = self
    }
    
    
    
    func fetchTitle(model: AlbumModel) {
        titleLabel.text = model.title
    }
    
    func fetchImageAndDescription(_ range: Int) {
        cellResult.removeAll()
        var minLimit = range * 10 - 1
        var maxLimit = range * 10 + 10
        viewModel.fetchPhotos { [weak self] data in
            guard let data = data else { return }
            self?.cellResult = data
            
            if range == 0 {
                self?.cellResult.removeSubrange(maxLimit...4999)
            } else {
                self?.cellResult.removeSubrange(maxLimit...4999)
                self?.cellResult.removeSubrange(0...minLimit)
            }
            
            for i in 0 ..< 10 {
                let iv = UIImageView()
                let label = UILabel()
                label.textColor = .black
                label.numberOfLines = 0
                iv.kf.setImage(with: URL(string: (self?.cellResult[i].url ?? self?.randomImageUrl)!))
                label.text = self?.cellResult[i].title
                iv.contentMode = .scaleAspectFit
                let xPosition = ((self?.contentView.frame.width)!) * CGFloat(i)

                iv.frame = CGRect(x: xPosition, y: 25 , width: ((self?.scrollView.frame.width)!), height: ((self?.scrollView.frame.height)! / 1.5))
                
                label.frame = CGRect(x: xPosition, y: 100, width: (self?.scrollView.frame.width)!, height: (self?.scrollView.frame.height)!)

                self?.scrollView.contentSize.width = (self?.scrollView.frame.width)! * CGFloat(i + 1)
                self?.scrollView.addSubview(iv)
                self?.scrollView.addSubview(label)

            }
        }
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for subview in scrollView.subviews {
            subview.removeFromSuperview()
        }
    }
}

extension CollectionCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
    }
}
