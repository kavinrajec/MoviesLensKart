//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Kavinraj M on 01/05/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var movieMmageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func updateCell(item: Movie) {
        nameLabel.text = item.name
        dateLabel.text = item.releaseDate
        ratingLabel.text = "\(item.rating ?? 0.0)"
        
        if let url = URL(string: Movie.BaseURL + (item.imagePath ?? "")) {
            
            DispatchQueue.global(qos: .userInteractive).async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                
                DispatchQueue.main.async {
                    self.movieMmageView.image = UIImage(data: imageData)
                }
            }
            
        }
        
    }
    
}
