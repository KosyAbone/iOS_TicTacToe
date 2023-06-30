//
//  Kosiso_TableViewCell.swift
//  Kosiso_Abone_Red_TicTacToe
//
//  Created by KOSSY on 2023-06-30.
//

import UIKit

class Kosiso_TableViewCell: UITableViewCell {

    // MARK:- Outlets
    
    @IBOutlet weak var winLossImage: UIImageView!
    
    @IBOutlet weak var whoWon: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
