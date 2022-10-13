//
//  ViewController.swift
//  PinchGesture
//
//  Created by 이대규 on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgPinch: UIImageView!
    
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UIPinchGestureRecognizer 클래스 상수 pinch를 선언한다.액션 인수는 핀치 제스처가 인식 되었을 때 실행할 메서드를 의미한다.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        // 뷰 객체의 addGestureRecognizer 메서드를 사용해 핀치 제스처를 등록한다.
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        // 이미지 imgPinch를 scale에 맞게 변환
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        // 다음 변환을 위하여 핀치의 스케일 속성을 1로 설정
        pinch.scale = 1
    }

//    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
//        // 우선 핀치 제스처의 상태를 state 속성을 사용하여 확인한다.
//        if(pinch.state == UIGestureRecognizer.State.began) {
//            // 핀치 제스처의 상태가 시작이면 앞에서 선언한 initializeFontSize 변수에 현재 텍스트의 글자 크기를 저장한다.
//            initialFontSize = txtPinch.font.pointSize
//        } else {
//            // 만일 핀치 제스처의 상태가 시작이 아니라면 핀치 제스처가 계속 진행되고 있는 상태이므로 initialFontSize에 저장해 둔 글자
//            // 크기 값에 scale 속성을 곱하여 텍스트의 글자 크기에 반영한다.
//            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
//        }
//    }

}

