
import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    var photo: Photo?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Detail"
        
        imageView.backgroundColor = .gray
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = "owner  name"
        descriptionLabel.text = "description label description label description label description label description label "
        
        
        
        
        
        ownerNameLabel.text = photo?.ownername
        if
            let iconserver = photo?.iconserver,
            let iconfarm = photo?.iconfarm,
            let nsid = photo?.owner,
            NSString(string: iconserver).intValue > 0 {
            fetchImage(with: "http://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(nsid).jpg") { data in
                self.ownerImageView.image =  UIImage(data: data)
            }
        }
        else {
            fetchImage(with:"https://www.flickr.com/images/buddyicon.gif") { data in
                self.ownerImageView.image =  UIImage(data: data)
            }
        }
        fetchImage(with: photo?.urlN) { data in
            self.imageView.image = UIImage(data: data)
        }
        
        title = photo?.title
        
        descriptionLabel.text = photo?.description?.content
    }
    
    private func fetchImage(with url: String?, competion: @escaping (Data) -> Void ){
        
        if let urlString = url,let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        competion(data)
                    }
                }
            }.resume()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
