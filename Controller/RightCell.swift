//
//  RightCell.swift
//  HMBOOK
//
//  Created by Hüsna Bıyıklı on 19.05.2024.
//

import UIKit

class RightCell: UITableViewCell {

    @IBOutlet weak var rightMessage: UILabel!
    
    @IBOutlet weak var nameSpace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
