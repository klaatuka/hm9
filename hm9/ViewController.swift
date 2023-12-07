

import UIKit

class ViewController: UIViewController {
    
    let collectData: [CollectData] = CollectData.getData()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize //авто подсчет размер ячейки
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.delegate = self
        $0.dataSource = self
        $0.frame = view.bounds
        $0.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reusId)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layout))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
    
    
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                CustomCell.reusId, for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        cell.config(data: collectData[indexPath.item], view: cell)
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegate {
    
}
