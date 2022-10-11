//
//  ViewController.swift
//  TapTouch
//
//  Created by 이대규 on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 터치가 시작될 때 호출된다
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 현재 발생한 터치 이벤트를 가져온다(몇개의 손가락으로 터치가 이루어 졌는지
        let touch = touches.first! as UITouch
        
        // 메서드에서 현재 발생한 이벤트의 종류를 출력한다.
        txtMessage.text = "Touched Began"
        //touches 세트 안에 포함된 터치의 개수를 출력한다.
        txtTapCount.text = String(touch.tapCount)
        // 터치 객체들 중 첫 번째 객체에서 탭의 개수를 가져와 출력한다.
        txtTouchCount.text = String(touches.count)
    }
    
    // 터지된 손가락이 움직였을때 호출됨
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moved"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    // 화면에서 손가락을 떼었을 때 호출됨.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Ended"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }

}

