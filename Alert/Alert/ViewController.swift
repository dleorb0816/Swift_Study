//
//  ViewController.swift
//  Alert
//
//  Created by 이대규 on 2022/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    // imgOn: 켜진 전구 이미지를 가지고 있는 UIImage 타입의 상수
    let imgOn = UIImage(named: "lamp_on.png")
    
    // imgOff: 꺼진 전구 이미지를 가지고 있는 UIImage 타입의 상수
    let imgOff = UIImage(named: "lamp_off.png")
    
    // imgRemove: 제거된 전구 이미지를 가지고 있는 UIImage 타입의 상수
    let imgRemove = UIImage(named: "lamp_remove.png")
    
    // isLampOn: 전구가 켜졌는지 여부를 나타내는 변수, 켜진상태 : true, 꺼진 상태 : false
    var isLampOn = true
    

    @IBOutlet var lamping: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lamping.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            // UIAlertController를 생성한다
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            // UIAlertAction을 생성한다.
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            // 생성된 onAction을 얼럿에 추가
            lampOnAlert.addAction(onAction)
            // present 메서드를 실행
            present(lampOnAlert, animated: true,completion: nil)
            
        }else{
            lamping.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            // UIAlertController를 생성한다
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?",
                                                 preferredStyle: UIAlertController.Style.alert)
            // UIAlertAction을 생성한다, 전구를 꺼야하므로 핸들러에 중괄호를 넣어 추가적으로 작업을 한다.
            //  반드시 self를 붙여야 에러가 발생하지 않음
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lamping.image = self.imgOff
                self.isLampOn=false
            })
            //  UIAlertAction을 추가로 생성한다. 특별한 동작을 하지 않을경우에는 핸들러를 nil로 한다.
            let cancelAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil)
            
            //  생성된 offAction, cancelAction을 얼럿에 추가한다
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            //  present 메서드를 실행한다.
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lamping.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 켭니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lamping.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lamping.image = self.imgRemove
            self.isLampOn=false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
    
}

