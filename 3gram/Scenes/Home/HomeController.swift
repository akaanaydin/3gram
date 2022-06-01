//
//  HomeController.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 1.06.2022.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var sideMenuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Bundle.main.loadNibNamed("HomeController", owner: self, options: nil)
        
        sideMenuButton.target = revealViewController()
        sideMenuButton.action = #selector(revealViewController()?.revealSideMenu)
        
        configure()
    }
    
    
    private func configure() {
        drawDesign()
    }
    private func drawDesign() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo-with-text"))
        
        view.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        
        collectionView.backgroundColor = .white
    }
    
}
