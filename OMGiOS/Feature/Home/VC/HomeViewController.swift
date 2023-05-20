//
//  HomeViewController.swift
//  OMGiOS
//
//  Created by 김다예 on 2023/05/20.
//

import UIKit

import SnapKit

class HomeViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = CarouselCollectionViewLayout()
        layout.itemSize = CGSize(width: 300, height: 400)
        layout.minimumInteritemSpacing = 10.0
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        view.backgroundColor = .white
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    func layout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
    }

}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
}
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4 // How many cells to display
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! HomeCollectionViewCell
        myCell.backgroundColor = UIColor.blue
        return myCell
    }

}
