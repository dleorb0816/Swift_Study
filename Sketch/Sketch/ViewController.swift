//
//  ViewController.swift
//  Sketch
//
//  Created by 이대규 on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    var lastPoint: CGPoint! // 바로전에 터치하거나 이동한 위치
    var lineSize:CGFloat = 2.0 // 선의 두께
    var lineColor = UIColor.red.cgColor // 선의 색상
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClearImageView(_ sender: UIButton) {
        imgView.image = nil // imgView에 nim을 넣습니다. nil은 아무것도 없다는 의미이다. 즉, 이미지 뷰의 이미지를 없애는 것이다.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 라인의 끝 모양을 라운드로 설정한다
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        // 현재 발생한 터치 이벤트를 가지고 온다
        let touch = touches.first! as UITouch
        // 터치된 위치를 currPoint로 가지고 온다
        let currPoint = touch.location(in: imgView)
        
        // 현재 이미지 뷰(Image View)에 있는 이미지를 이미지뷰(Image View)에 있는 이미지를 이미지 뷰의 크기로 그린다.
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width,
                                       height: imgView.frame.size.height))
        
        // 이전에 이동된 위치인 lastPoint로 시작 위치를 이동시킨다.
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        
        // lastPoint에서 현재 위치인 currPoint까지 선을 추가한다.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // 현재 터치된 위치를 lastPoint라는 변수에 할당한다.
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 라인의 끝 모양을 라운드로 설정한다
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        // 현재 발생한 터치 이벤트를 가지고 온다
        let touch = touches.first! as UITouch
        // 터치된 위치를 currPoint로 가지고 온다
        let currPoint = touch.location(in: imgView)
        
        // 현재 이미지 뷰(Image View)에 있는 이미지를 이미지뷰(Image View)에 있는 이미지를 이미지 뷰의 크기로 그린다.
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width,
                                       height: imgView.frame.size.height))
        
        // 이전에 이동된 위치인 lastPoint로 시작 위치를 이동시킨다.
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        
        // lastPoint에서 현재 위치인 currPoint까지 선을 추가한다.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    
}

