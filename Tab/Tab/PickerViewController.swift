//
//  ViewController.swift
//  PickerView
//
//  Created by 이대규 on 2022/08/02.
//

import UIKit

class PickerViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10  // 이미지의 파일명을 저장할 배열의 최대 크기를 지정한다.
    let PICKER_VIEW_COLUMN = 2  // PICKER_VIEW_COLUMN: 피커 뷰의 열의 개수를 지정한다
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg","2.jpg","3.jpg","4.jpg","5.jpg",
                        "6.jpg","7.jpg","8.jpg","9.jpg","10.jpg" ]
    
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    

    // return the number of 'columns' to display
    // 피커뷰에게 컴포넌트의 수를 정수 값으로 넘겨주는 델리게이트 메서드이다. 피커뷰의 컴포넌트는 피커 뷰에 표시되는 열의 개수를 의미한다.
    // 여기서는 PICKER_VIEW_COLUMN의 값인 1을 넘겨준다
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // return the # of rows in each component..
    // numberOfRowsInComponent 인수를 가지는 델리게이트 메서드이다. 피커 뷰에게 컴포넌트의 열의 개수를 정수 값으로 넘겨준다.
    // 이값은 피커뷰의 해당 열에서 선택할 수 있는 행의 개수 (데이터의 개수)를 의미한다. 여기에서는 배열 imageFileName의 개수 값인 10을
    // imageFileName.count를 사용하여 넘겨준다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent
                    component: Int) -> Int {
        return imageFileName.count
    }
    
    // titleForRow 인수를 가지는 델리게이트 메서드이다. 피커뷰 에게 컴포넌트의 각 열의 타이틀을 문자열(String) 값으로 넘겨준다.
    // 여기서는 imageFileName에 저장되어 있는 파일명을 넘겨준다
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView { // 피커뷰에게 컴포넌트의 각 열의 뷰를 UIView타입의 값으로 넘겨준다. 여기서는 이미지 뷰에 저장되어 있는 이미지를 넘겨준다
        let imageView = UIImageView(image: imageArray[row]) // 선택된 row에 해당하는 이미지를 imageArray에서 가져온다
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)   // 이미지 뷰의 프레임 크기를 설정한다.
        
        return imageView    //  이미지 뷰를 리턴한다.
    }
    
    // 사용자가 피커 뷰의 룰렛에서 선택한 row 값을 사용하여 imageFileName 배열에서 row 값에 해당하는 문자열을 가지고 온다.
    // 그리고 가져온 문자열을 레이블의 아웃렛 변수인 lblImageFileName.text에 저장한다
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if( component == 0){
            lblImageFileName.text = imageFileName[row]
        }
        else {
            imageView.image = imageArray[row]
        }
        
    }
}

