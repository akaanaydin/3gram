//
//  CommentController.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 1.06.2022.
//

import UIKit
import Alamofire

class CommentController: UIViewController {
// MARK: - UI Elements
    @IBOutlet var sideMenuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
// MARK: - Properties
    private var viewModel: CommentViewModelProtocol = CommentViewModel(service: Service())
    var comments = [CommentModel]()
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
// MARK: - Buttons
    @IBAction func sendButton(_ sender: UIButton) {
        indicator.startAnimating()
        sender.isEnabled = false
        self.indicator.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.indicator.startAnimating()
            self.indicator.isHidden = true
            sender.isEnabled = true
            
            // Alert
            let alert = UIAlertController(title: "Good News!", message: "Your comment posted", preferredStyle: .alert)
            self.commentTextField.text = ""
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                @unknown default:
                    print("error")
                }
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
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
        let nib = UINib(nibName: String(describing: CommentCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: CommentCell.self))
        // Side Menu
        sideMenuButton.target = revealViewController()
        sideMenuButton.action = #selector(revealViewController()?.revealSideMenu)
        // Indicator
        self.indicator.isHidden = true
        // Navigation Bar
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        // View Controller
        view.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        // Table View Delegate and Data Source
        tableView.delegate = self
        tableView.dataSource = self
        // Table View Design
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 12
        tableView.separatorStyle = .none
    }
    // Fetch Data Function
    private func fetchData() {
        viewModel.fetchComments { [weak self] data in
            guard let data = data else { return }
            self?.comments = data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        } onError: { error in
            print(error)
        }
    }
}

// MARK: - Extensions

// Table View Delegate and Data Source
extension CommentController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CommentCell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self), for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        // Cell Data
        cell.fetchComments(model: comments[indexPath.row])
        return cell
    }
    
    
}
