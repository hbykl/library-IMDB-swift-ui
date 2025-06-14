//
//  LeftCell.swift
//  HMBOOK
//
//  Created by Hüsna Bıyıklı on 19.05.2024.
//

import UIKit

class LeftCell: UITableViewCell {

    @IBOutlet weak var leftMessage: UILabel!
    
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
