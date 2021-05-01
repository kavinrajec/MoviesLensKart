//
//  ViewController.swift
//  Movies
//
//  Created by Kavinraj M on 01/05/21.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.readJSON()
    }

    private func configureTableView() {
        self.moviesTableView.delegate = self
        self.moviesTableView.dataSource = self
        
        self.moviesTableView.register(UINib(nibName: MovieTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }

    private func readJSON() {
        
        //Load data from Json
        if let list = DataUtils.loadJson(fileName: "movies", type: [Movie].self) {
            
            self.movies = list
            self.moviesTableView.reloadData()
        }
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else {return UITableViewCell()}
        
        cell.updateCell(item: movies[indexPath.row])
        return cell
    }
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
