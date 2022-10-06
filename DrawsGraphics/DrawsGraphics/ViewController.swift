//
//  ViewController.swift
//  DrawsGraphics
//
//  Created by 이대규 on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        // 콘텍스트를 이미지 뷰의 크기와 같게 생성한다.
        UIGraphicsBeginImageContext(imgVIew.frame.size)
        // 생성한 콘텍스트의 정보를 가져온다.
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Line
        // 선의 굵기를 2.0으로 설정
        context.setLineWidth(2.0)
        // 해당 콘텍스트의 선 색깔을 빨강으로 설정
        context.setStrokeColor(UIColor.red.cgColor)
        
        // 그림을 그리기 위해 시작 위치로 커서를 이동함(0,0)은 화면의 왼쪽 윗부분의 지표이며, 여기서는 시작 위치를 (70,50)으로 지정한다.
        context.move(to: CGPoint(x: 70, y: 50))
        // 현재 위치에서 지저한 위치까지 선을 추가한다.그리고 싶은 선은 계속 이어서 추가할 수 있다. 여기서는 임의로 (270,250)을 입력
        context.addLine(to: CGPoint(x: 270, y: 250))
        // 추가한 경로에 콘텍스트를 그린다.
        context.strokePath()
        
        // Draw Triangle
        // Draw Line에서 사용한 방법으로 삼각형을 그린다. 색상은 파란색, 삼각형의 꼭지점이 세개이므로 context.addLine 좌표를 다르게 하여 세번 입력한다.
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        
        // 현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 나타낸다
        imgVIew.image = UIGraphicsGetImageFromCurrentImageContext()
        // 그림그리기를 끝낸다.
        UIGraphicsEndImageContext()
    }
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        // xy 좌표(70,100)에서 시작하고 폭이 200픽셀,높이가 200픽셀인 사각형을 그린다. 이때 시작하는 좌표인(70,100)은 완성된 사각형의 왼쪽위의 꼭지점을 말한다.
        UIGraphicsBeginImageContext(imgVIew.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x:70, y: 100, width: 200, height: 200))
        context.strokePath()
        
        imgVIew.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgVIew.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Eclipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        // XY 좌표(70,50)에서 시작하고 폭이 200픽셀,높이가 100픽셀인 사각형 안에 내접하는 타원을 그립니다.
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        // XY 좌표(70,200)에서 시작하고 폭이 200픽셀,높이가 200픽셀인 사각형 안에 내접하는 원을 그립니다. 폭과 높이를 같게 설정하면 원을 그릴수 있다.
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))
        context.strokePath()
        
        imgVIew.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    @IBAction func btDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgVIew.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Arc
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        // 현재 위치에서 두개의 접점(250,50),(250,200)사이에 내접한 반지름이 50인 호를 그리겠다는 뜻
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgVIew.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgVIew.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        // 도형의 내부를 색상으로 채웁니다. red 자리에 blue, green 등의 다른 색상 값이 들어갈 수 있다.
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        // 사각형의 내부를 색상으로 채웁니다.
        context.fill(rectangle)
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        // 도형의 내부를 색상으로 채운다. red 자리에,blue,green등의 다른 색상 값이 들어갈수 있다.
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        // 사각형의 내부를 색상으로 채운다.
        context.fillEllipse(in: circle)
        context.strokePath()
        
        // Draw Triangle
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        // 원,타원의 내부를 색상으로 채운다
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        // 선의 내부를 색상으로 채운다
        context.fillPath()
        context.strokePath()
        
        imgVIew.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
}

