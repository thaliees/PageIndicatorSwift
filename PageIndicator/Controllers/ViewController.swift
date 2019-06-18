//
//  ViewController.swift
//  PageIndicator
//
//  Created by Thaliees on 6/18/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var container: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    private let images:[String] = [ "developer", "code" ]
    private let titles:[String] = [ "Developer", "Code" ]
    private let descriptions:[String] = [ "Here you can find developers from around the world!", "You can share or search code: JAVA, JavaScript, Asp.Net, Swift" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Discomment the next two lines, only you can't
        //container.delegate = self
        //container.dataSource = self
    }
    
    // MARK: Methods UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // How many page will have each section?
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create cell to show
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageCell", for: indexPath) as! PageCollectionViewCell
        // Set resources
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.title.text = titles[indexPath.row]
        cell.descrip.text = descriptions[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.bounds.size.height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // How many sections will have CollectionView?
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Avoid space between cells
        return 0
    }
    
    // MARK: Method UIPageControl
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageIndicator.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

