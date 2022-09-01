//
//  ViewController.swift
//  Navigation
//
//  Created by 이대규 on 2022/08/29.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    

    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    // prepare 함수는 해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이며 데이터 전달을 위해 사용된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그웨이 도착 컨트롤러를 EditViewController로 설정한다.
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
        // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
        // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use bar Button"
        }
        
        // 메인화면의 메시지가 수정화면으로 전달
        editViewController.textMessage = txMessage.text!
        
        // prepare 함수에서 editViewController, 즉 '수정화면'의 isOn에 '메인화면'의 상태를 전달한다.
        editViewController.isOn = isOn
        
        // 수정화면의 메시지가 메인화면으로 전달
        editViewController.delegate = self
    }
    
    // 이 didMessageEditDone함수는 에디트 뷰 컨트롤러에서 함수를 호출하여 메시지를 전달해 주는데, 이 메시지의 스트링 값을
    // '메인화면'의 텍스트 필드에 텍스트로 보여준다. 즉, '수정 화면'의 데이터를 '메인화면'에 전달하여 보여 주는 것이다.
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    // 이 isOn을 메인화면의 isOn으로 보여주면 이값이 이미지 뷰의 이미지에 적용되어 켜진 전구와 꺼진 전구로 표시된다.
    // 즉 수정화면의 스위치 값을 메인화면에 전달하여 켜진 전구 또는 꺼진 전구를 보여준다.
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }


}

