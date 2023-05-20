//
//  CarouselCollectionViewLayout.swift
//  OMGiOS
//
//  Created by Joon Baek on 2023/05/21.
//

import UIKit

class CarouselCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        minimumLineSpacing = 35
        sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }

        let collectionViewSize = collectionView.bounds.size
        let halfCollectionViewWidth = collectionViewSize.width / 2

        guard let layoutAttributesList = layoutAttributesForElements(in: collectionView.bounds) else { return proposedContentOffset }

        //해당 셀의 오프셋이 컬렉션뷰의 시작, 또는 끝에 있는지 확인
        if proposedContentOffset.x <= 0 || proposedContentOffset.x >= collectionView.contentSize.width - collectionViewSize.width {
            return proposedContentOffset
        }

        let proposedContentOffsetCenterX = proposedContentOffset.x + halfCollectionViewWidth

        // 첫번째 셀의 centerX 계산
        let firstCellCenterX = layoutAttributesList.first?.center.x ?? 0
        let centeredFirstCellX = firstCellCenterX - halfCollectionViewWidth

        // 마지막 셀의 centerX 계산
        let lastCellCenterX = layoutAttributesList.last?.center.x ?? 0
        let centeredLastCellX = lastCellCenterX - halfCollectionViewWidth

        // 해당 셀의 첫번째 혹은 마지막셀의 centerX 중심에 따른 셀의 offset 조정
        var targetContentOffsetX: CGFloat
        if proposedContentOffsetCenterX < centeredFirstCellX {
            targetContentOffsetX = centeredFirstCellX
        } else if proposedContentOffsetCenterX > centeredLastCellX {
            targetContentOffsetX = centeredLastCellX
        } else {
            targetContentOffsetX = centeredFirstCellX + (proposedContentOffsetCenterX - firstCellCenterX)
        }

        return CGPoint(x: targetContentOffsetX, y: proposedContentOffset.y)
    }

}

