//
//  HomeCommentViewController.swift
//  RealWeather
//
//  Created by sdondon on 23/02/2019.
//  Copyright © 2019 yapp. All rights reserved.
//

import UIKit

class HomeCommentViewController: UIViewController {
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    fileprivate var datasource: [Comment] = []
    
    var scrollView: UIScrollView {
        return collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDummyData()
    }
    
    fileprivate func setUpDummyData() {
        let comment1: Comment = Comment()
        comment1.name = "하이"
        comment1.commentText = "테스트징"
        comment1.time = "2시간 전"
        comment1.likeCount = 99
        
        datasource = [
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1,
            comment1
        ]
        collectionView.reloadData()
    }
    
    // MARK: 추후 구조 수정
    func registerComment(_ text: String) {
        let dummyComment = Comment()
        dummyComment.commentText = text
        dummyComment.name = "프로출근러"
        dummyComment.profileImage = nil
        dummyComment.likeCount = Int.random(in: 0..<100)
        
        datasource.append(dummyComment)
        collectionView.reloadData()
        
        let lastIndex = datasource.count - 1
        collectionView.scrollToItem(at: IndexPath(item: lastIndex, section: 0), at: .bottom, animated: true)
    }
}

extension HomeCommentViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCommentCell", for: indexPath)
        
        if let commentCell = cell as? HomeCommentCell {
            let commentData: Comment = datasource[indexPath.item]
            commentCell.updateUI(with: commentData)
        }
        
        return cell
    }
}

extension HomeCommentViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension HomeCommentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 462, left: 0, bottom: 90, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
}

extension HomeCommentViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        (parent as? HomeViewController)?.scrollTopView(scrollView)
    }
}

class HomeCommentCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var profileImageView: UIImageView!
    @IBOutlet fileprivate weak var likeImageView: UIImageView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var commentLabel: UILabel!
    @IBOutlet fileprivate weak var timeLabel: UILabel!
    @IBOutlet fileprivate weak var likeCountLabel: UILabel!
    
    func updateUI(with comment: Comment) {
        profileImageView.image = comment.profileImage
//        likeImageView.image = comment.isLiked ? comment.profileImage : comment.profileImage
        nameLabel.text = comment.name
        commentLabel.text = comment.commentText
        timeLabel.text = "\(comment.time)" // 추후 변경 필요
        likeCountLabel.text = "\(comment.likeCount)"
    }
}
