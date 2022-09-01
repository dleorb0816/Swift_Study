//
//  EditViewController.swift
//  Navigation
//
//  Created by 이대규 on 2022/08/30.
//

import UIKit


// 프로토콜 형태의 델리게이트를 추가
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    // 수정 화면의 스위치 상태를 메인화면으로 보내기 위해 델리게이트에 didImageOnOffDone함수를 추가
    func didImageOnOffDone( _ controller: EditViewController, isOn: Bool)
}


class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        // 세그웨이를 추가할때 'Show' 형태로 했기 때문에 되돌아 갈때는 'pop'의 형태로 해야한다.
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
