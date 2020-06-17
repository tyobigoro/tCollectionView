import UIKit

//// 背景用のView
//class CellBgView: UIView {
//
//    init(num: Int) {
//        super.init(frame: CGRect.zero)
//        // 偶数と奇数で色変えてみよう
//        backgroundColor = num % 2 == 0 ? .red : .orange
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

class ViewController: UIViewController{
    
   var imageNames = ["a", "b", "c", "c", "c", "c", "d", "d"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    //private let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CollectionViewのレイアウト設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        collectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        let imageName = imageNames[indexPath.row]
        cell.setImageName(imageName)
        
        //cell.selectedBackgroundView = CellBgView(num: indexPath.row)
        return cell
    }
    
}

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
    }
    
    func setImageName(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}


// あとはレイアウト用です

//extension ViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = UIScreen.main.bounds.width - paddingSpace
//        let withPerItem = availableWidth / itemsPerRow
//
//        //cellの大きさを返す
//        return CGSize(width: withPerItem, height: withPerItem)
//
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return sectionInsets
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return sectionInsets.left
//
//    }
//
//}



