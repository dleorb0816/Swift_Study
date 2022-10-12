//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 이대규 on 2022/10/12.
//

import UIKit

class ViewController: UIViewController {
    let numOfTouchs = 2
    
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 배열을 UIImage형으로 만들었기 때문에 append의 인수로 UIImage형의 값을 입력한다.
        // 스와이프하면 검은색 화살표가 빨간색이 되도록 하기 위해 처음에는 검은색 화살표의 파일명, 그 뒤에는 빨간색 화살표의
        // 파일명을 입력하는 식으로 입력한다. 첫 번째로 추가한 이미지는 imgUp[0]에 저장되고, 두 번째로 추가한 이미지는 imgUp[1]에
        // 저장된다.
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        // 각 배열의 첫번째 값은 검은색 화살표를 나타내며 인자 값[0]을 사용하여 참조 할수 있다. 또한 두 번째 값은 빨간색 화살표를 나타내며, 인자 값[1]을 사용하여 참조할 수 있습니다.
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        // UISwipeGestureRecognizer 클래스 상수 swipeUp을 선언한다. action인수는 해당 스와이프 제스처를 행했을 때 실행할 메서드를 의미
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        // 위에서 선언한 UISwipeGestureRecognizer클래스 상수 swipeUp의 direction속성을 설정한다. 여기서는 up
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        
        // 뷰 객체의 addGestureRecognizer 메서드를 사용하여 위쪽 방향의 스와이프 제스처를 등록한다.
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        self.view.addGestureRecognizer(swipeRight)
        
        // UISwipeGestureRecognizer 클래스 상수 swipeUp을 선언한다. action인수는 해당 스와이프 제스처를 행했을 때 실행할 메서드를 의미
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        // 위에서 선언한 UISwipeGestureRecognizer클래스 상수 swipeUp의 direction속성을 설정한다. 여기서는 up
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        // 뷰 객체의 addGestureRecognizer 메서드를 사용하여 위쪽 방향의 스와이프 제스처를 등록한다.
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRight)
        
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        // 만일 제스쳐가 있다면
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            // 우선 전체 이미지 뷰를 검은색 화살표로 초기화
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            // switch 문을 사용해 제스처의 방향에 따라 해당 방향의 이미지를 빨간색 이미지로 변경한다.
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewUp.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewUp.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewUp.image = imgRight[1]
            default:
                break
            }
        }
    }

    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        // 만일 제스쳐가 있다면
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            // 우선 전체 이미지 뷰를 검은색 화살표로 초기화
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            // switch 문을 사용해 제스처의 방향에 따라 해당 방향의 이미지를 빨간색 이미지로 변경한다.
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewUp.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewUp.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewUp.image = imgRight[2]
            default:
                break
            }
        }
    }
}

