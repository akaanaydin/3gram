//
//  CollectionCell.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 3.06.2022.
//

import UIKit
import Kingfisher

class CollectionCell: UICollectionViewCell {
// MARK: - UI Elements
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
// MARK: - Properties
    private var randomImageUrl = "https://picsum.photos/200"
    
    private var viewModel: ViewModelProtocol = HomeViewModel(service: Service())
    
    var cellResult = [PhotoModel]()

// MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.delegate = self
    }
    
    
// MARK: - Functions
    // Fetch Data for Cell Title
    func fetchTitle(model: AlbumModel) {
        titleLabel.text = model.title
    }
    // Fetch Data for Cell Images and Descriptions
    func fetchImageAndDescription(_ range: Int) {
        // Min and Max Limits For Image Count
        let minLimit = range * 10 - 1
        let maxLimit = range * 10 + 10
        
        fetchData(range, minLimit, maxLimit)
        
    }
    
    // Fetch Data Function
    private func fetchData(_ range: Int, _ minLimit: Int, _ maxLimit: Int) {
        viewModel.fetchPhotos { [weak self] data in
            guard let data = data else { return }
            self?.cellResult = data
            if range == 0 {
                self?.cellResult.removeSubrange(maxLimit...4999)
            } else {
                self?.cellResult.removeSubrange(maxLimit...4999)
                self?.cellResult.removeSubrange(0...minLimit)
            }
            
            self?.scrollViewDesign()
            
        } onError: { error in
            print(error)
        }
    }
    
    // Scroll View Design
    private func scrollViewDesign() {
        for i in 0 ..< 10 {
            // UI Elements
            let iv = UIImageView()
            let label = UILabel()
            
            // Label Features
            label.textColor = .black
            label.numberOfLines = 0
            label.text = self.cellResult[i].title
            
            // Image View Features
            iv.kf.setImage(with: URL(string: (self.cellResult[i].url ?? self.randomImageUrl)!))
            iv.contentMode = .scaleToFill
            
            
            // UI Element Positions
            let xPosition = ((self.contentView.frame.width)) * CGFloat(i)

            iv.frame = CGRect(x: xPosition, y: 25 , width: ((self.scrollView.frame.width)), height: ((self.scrollView.frame.height) / 1.5))
            
            label.frame = CGRect(x: xPosition, y: 100, width: (self.scrollView.frame.width), height: (self.scrollView.frame.height))

            self.scrollView.contentSize.width = (self.scrollView.frame.width) * CGFloat(i + 1)
            
            // Add Subviews
            self.scrollView.addSubview(iv)
            self.scrollView.addSubview(label)

        }
    }
    // Delete Current Scroll View Subviews for Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        for subview in scrollView.subviews {
            subview.removeFromSuperview()
        }
    }
}

// MARK: - Extensions
extension CollectionCell: UIScrollViewDelegate {
    // Page Controller Function
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
    }
}
