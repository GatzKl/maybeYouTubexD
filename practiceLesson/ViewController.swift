//
//  ViewController.swift
//  practiceLesson
//
//  Created by Александр Калашников on 30/6/22.tab
//

import UIKit

class ViewController: UIViewController {
    
//    var videosArray: [String] = ["name", "name", "name", "name"]3
    
    @IBOutlet weak var utubeTableView: UITableView!
    
    var sortButton1 = UIButton()
    var sortButton2 = UIButton()
    
    var videosArray: [VideoModel] = [
        VideoModel(viewsCount: Int.random(in: 1...1000000), name: "Идеальный мир №1", image: UIImage(named: "1")!),
        VideoModel(viewsCount: Int.random(in: 1...1000000), name: "От Зимы До Зимы №1", image: UIImage(named: "2")!),
        VideoModel(viewsCount: Int.random(in: 1...1000000), name: "От Зимы До Зимы №1", image: UIImage(named: "3")!),
        VideoModel(viewsCount: Int.random(in: 1...1000000), name: "Кровавая луна №23", image: UIImage(named: "4")!),
        VideoModel(viewsCount: Int.random(in: 1...1000000), name: "Первая сборка с сюжетом!!!", image: UIImage(named: "1")!),
        VideoModel(viewsCount: Int.random(in: 1...1000000), name: "Прохождение майнкрафта с фростом", image: UIImage(named: "2")!),
        VideoModel(viewsCount: Int.random(in: 1...1000000), name: "Я программист", image: UIImage(named: "3")!),
    ]
    
    var viewersArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sortButton1)
        view.addSubview(sortButton2)

        sortButton1.backgroundColor = .black
        sortButton2.backgroundColor = .black
        sortButton1.layer.borderColor = .init(gray: 255, alpha: 120)
        sortButton2.layer.borderColor = .init(gray: 255, alpha: 120)
        sortButton1.setTitle("<", for: .normal)
        sortButton2.setTitle(">", for: .normal)
        sortButton1.layer.cornerRadius = 80/2
        sortButton2.layer.cornerRadius = 80/2
        sortButton1.addTarget(self, action: #selector(sortUp), for: .touchUpInside)
        sortButton2.addTarget(self, action: #selector(sortDown), for: .touchUpInside)

        view.addSubview(sortButton1)
        view.addSubview(sortButton2)
        sortButton1.translatesAutoresizingMaskIntoConstraints = false
        sortButton2.translatesAutoresizingMaskIntoConstraints = false

        sortButton1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        sortButton1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        sortButton1.heightAnchor.constraint(equalToConstant: 80).isActive = true
        sortButton1.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sortButton1.layer.borderWidth = 2

        sortButton2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        sortButton2.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 50).isActive = true
        sortButton2.heightAnchor.constraint(equalToConstant: 80).isActive = true
        sortButton2.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sortButton2.layer.borderWidth = 2
        
        view.backgroundColor = .gray
        
        utubeTableView.dataSource = self
        utubeTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    @objc func sortUp() {
        videosArray.sort(by: {$0.viewsCount > $1.viewsCount})
        utubeTableView.reloadData()
    }

    @objc func sortDown() {
        videosArray.sort(by: {$0.viewsCount < $1.viewsCount})
        utubeTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! videoCell
        cell.previewImageView.image = videosArray[indexPath.row].image
        cell.nameLabel.text = videosArray[indexPath.row].name
        cell.viewersCountLabel.text = "Просмотры: \(String(videosArray[indexPath.row].viewsCount))"
        
        viewersArray.append(videosArray[indexPath.row].viewsCount)
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
