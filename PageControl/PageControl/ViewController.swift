//
//  ViewController.swift
//  PageControl
//
//  Created by 이대규 on 2022/08/24.
//

import UIKit

var images = ["1.jpg","2.jpg","3.jpg","6.jpg","7.jpg","8.jpg"]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // numberOfPages : 페이지 컨트롤의 전체 페이지 수를 의미한다.
        pageControl.numberOfPages = images.count
        
        // currentPage : 현재 페이지를 의미한다.
        pageControl.currentPage = 0
        
        // pageIndicatorTintColor : 페이지 컨트롤의 페이지를 표시하는 부분의 색상을 의미한다. UIColor.green을 입력하면
        // 페이지를 표시하는 페이지 컨트롤의 전체 동그라미 부분이 초록색으로 표시된다.
        pageControl.pageIndicatorTintColor = UIColor.green
        
        // currentIndicatorTintColor : 페이지 컨트롤의 현재 페이지를 표시하는 색상을 의미, UIColor.red를 입력하면 현재 페이지가
        // 빨간색으로 표시된다.
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

