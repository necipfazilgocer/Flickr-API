

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var ownerImageView: UIImageView!
     @IBOutlet weak var ownerNameLabel: UILabel!
     @IBOutlet weak var photoImageView: UIImageView!
     @IBOutlet weak var tittleLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ownerImageView.layer.cornerRadius = 24.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
