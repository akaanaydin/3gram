//
//  CommentController.swift
//  3gram
//
//  Created by Arslan Kaan AYDIN on 1.06.2022.
//

import UIKit
import Alamofire

class CommentController: UIViewController {
    
    @IBOutlet var sideMenuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    private var viewModel: CommentViewModelProtocol = CommentViewModel(service: Service())
    var comments = [CommentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.indicator.isHidden = true
        
        let nib = UINib(nibName: String(describing: CommentCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: CommentCell.self))
        
        sideMenuButton.target = revealViewController()
        sideMenuButton.action = #selector(revealViewController()?.revealSideMenu)
        
        configure()
        
        viewModel.fetchComments { [weak self] data in
            guard let data = data else { return }
            self?.comments = data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        indicator.startAnimating()
        sender.isEnabled = false
        self.indicator.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.indicator.startAnimating()
            self.indicator.isHidden = true
            sender.isEnabled = true
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
                    
                }
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    private func configure() {
        drawDesign()
    }
    
    private func drawDesign() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        view.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 12
        tableView.separatorStyle = .none
    }
    
}

extension CommentController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self), for: indexPath) as! CommentCell
        guard let cell: CommentCell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self), for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        cell.fetchComments(model: comments[indexPath.row])
        return cell
    }
    
    
}
