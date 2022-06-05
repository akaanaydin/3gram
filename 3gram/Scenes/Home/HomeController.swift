//
//  HomeController.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 1.06.2022.
//

import UIKit
import Alamofire
import SwiftUI
import Kingfisher


class HomeController: UIViewController {
// MARK: - UI Elements
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var sideMenuButton: UIBarButtonItem!
    
// MARK: - Properties
    private var viewModel: ViewModelProtocol = HomeViewModel(service: Service())
    
    var albumTitleResult = [AlbumModel]()
    var photoAndDescriptionResult = [PhotoModel]()
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
// MARK: - Functions
    
    // Configure Function
    private func configure() {
        drawDesign()
        fetchData()
    }
    
    // Design Function
    private func drawDesign() {
        // Cell Register
        let nib = UINib(nibName: String(describing: CollectionCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: CollectionCell.self))
        // Side Menu
        sideMenuButton.target = revealViewController()
        sideMenuButton.action = #selector(revealViewController()?.revealSideMenu)
        // Navigation Bar
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo-with-text"))
        // View Controller
        view.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        // Collection View Delegate and Data Source
        collectionView.delegate = self
        collectionView.dataSource = self
        // Collection View Design
        collectionView.backgroundColor = .clear
    }
    
    // Fetch Data Function
    private func fetchData() {
        viewModel.fetchAlbums { [weak self] data in
            guard let data = data else { return }
            self?.albumTitleResult = data
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        } onError: { error in
            print(error)
        }
    }
    
}

// MARK: - Extensions

// Collection View Delegate and Data Source
extension HomeController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albumTitleResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionCell.self), for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        
        // Cell Design
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.clipsToBounds = true
        cell.backgroundColor = .white
        // Cell Data
        cell.fetchTitle(model: albumTitleResult[indexPath.row])
        cell.fetchImageAndDescription(indexPath.row)
        return cell
    }
    
    // Spacing Between Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    // Cell Design in Collection View
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: collectionView.frame.size.height / 2.4
        )
        
    }
}
