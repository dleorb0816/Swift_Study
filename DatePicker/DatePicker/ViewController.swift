//
//  ViewController.swift
//  DatePicker
//
//  Created by 이대규 on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)   // timeSelector : 타이머가 구동되면 실행할 함수를 지정
    let interval = 1.0  // 타이머의 간격 1.0은 1초
    var count = 0   // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender //  데이트 피커를 선택할 때 발생하는 액션 함수인 'changeDatePicker'가 호출되면서 sender라는 UIDatePicker 자료형의 인수가 전달된다.
                                    //  이 sender를 datePicker라는 상수에 저장한다
        
        let formatter = DateFormatter() //  날짜를 출력하기 위해 DateFormatter라는 클래스 상수 formatter를 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"   // formatter의 dateFormat 속성을 설정 포맷은 '년-월-일 시:분:초 요일'
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        // 데이트 피커에서 선택한 날짜를 formatter의 dateFomat에서 설정한 포맷대로 string 메서드를 사용하여 문자열(String)로 변환한다. "선택시간 :"이라는 문자열에
        // 위에서 문자열로 변환한 date값을 추가하여 lblPickerTime의 text에 넣습니다.
    }
    
    @objc func updateTime() {   // Swift 4 에서는 #selector()의 인자로 사용될 메서드를 선언할 때 Objective-C와의 호환서을 위하여 함수 앞에 반드시 @objc 키워드를 붙여야 한다
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate() // 현재 시간을 NSDate 함수를 사용하여 가져온다
        
        let formatter = DateFormatter() // 날짜를 출력하기 위해 DateFomatter라는 클래스의 상수 formatter를 선언 한다
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"    // 앞에서 선언한 상수 formatter의 dateFormat속성을 설정한다
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)   // formatter.string(date)는 피커 뷰에서 선택한 날짜를 formatter의
                                                                                 // dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환
    }
}

