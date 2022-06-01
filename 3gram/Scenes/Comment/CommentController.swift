//
//  CommentController.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 1.06.2022.
//

import UIKit

class CommentController: UIViewController {
    
    @IBOutlet var sideMenuButton: UIBarButtonItem!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        sideMenuButton.target = revealViewController()
        sideMenuButton.action = #selector(revealViewController()?.revealSideMenu)

    }
    
}
