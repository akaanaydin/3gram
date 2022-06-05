//
//  AboutController.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 1.06.2022.
//

import UIKit

class AboutController: UIViewController {
// MARK: - UI Elements
    @IBOutlet var sideMenuButton: UIBarButtonItem!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var followUsLabel: UILabel!
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuButton.target = revealViewController()
        sideMenuButton.action = #selector(revealViewController()?.revealSideMenu)
        
        configure()
    }
// MARK: - Buttons
    @IBAction func socialButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            guard let url = URL(string: "https://facebook.com") else { return }
            UIApplication.shared.open(url)
        case 1:
            guard let url = URL(string: "https://stackoverflow.com") else { return }
            UIApplication.shared.open(url)
        case 2:
            guard let url = URL(string: "https://github.com") else { return }
            UIApplication.shared.open(url)
        case 3:
            guard let url = URL(string: "https://telegram.org") else { return }
            UIApplication.shared.open(url)
        case 4:
            guard let url = URL(string: "https://instagram.com") else { return }
            UIApplication.shared.open(url)
        case 5:
            guard let url = URL(string: "https://figma.com") else { return }
            UIApplication.shared.open(url)
        default:
            break
        }
    }
    
// MARK: - Functions
    // Configure Function
    private func configure() {
        drawDesign()
    }
    // Design Function
    private func drawDesign() {
        // Navigation Bar
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // View Controller
        view.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        
        // View
        mainView.layer.cornerRadius = 12
        mainView.clipsToBounds = true
        
    }
    
}
