//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 이대규 on 2022/10/04.
//

import UIKit
import MobileCoreServices // 다양한 타입들을 정의해 놓은 헤더 파일 ios에서 사용할 모든 데이터 타입들이 정의되어있는 헤더파일의 집합
                            // 미디어 타입을 사용하기 위해서는 import를 사용해서 MobileCoreServices를 추가해야됨

class ViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet var imgView: UIImageView!
    
    // UIImagePickerController의 인스턴스 변수 생성
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    // 촬영을 하거나 포토 라이브러리에서 불러온 사진(Image)을 저장할 변수
    var captureImage: UIImage!
    // 녹화한 비디오의 URL을 저장할 변수
    var videoURL: URL!
    // 이미지 저장 여부를 나타낼 변수
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){ // 카메라의 사용 가능 여부를 확인
            // 카메라 촬영 후 저장할 것이기 때문에 이미지 저장을 허용 한다.
            flagImageSave = true
            
            // 이미지 피커의 델리게이트를 self로 설정한다.
            imagePicker.delegate = self
            // 이미지 피커의 소스 타입을 camera로 설정한다
            imagePicker.sourceType = .camera
            // 미디어 타입은 "public.image"로 설정
            imagePicker.mediaTypes = ["public.image"]
            // 편집은 허용하지 않는다
            imagePicker.allowsEditing = false
            // 현재 뷰 컨트롤러를 imagePicker로 대체 한다.
            present(imagePicker,animated: true, completion: nil)
        }
        else {
            // 카메라를 사용할 수 없을때는 경고창을 나타낸다.
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            // 이미지 피커의 델리게이트를 self로 설정한다.
            imagePicker.delegate = self
            // 이미지 피커의 소스 타입을 photoLibrary로 설정한다
            imagePicker.sourceType = .photoLibrary
            // 미디어 타입은 "public.image"로 설정
            imagePicker.mediaTypes = ["public.image"]
            // 편집은 허용하
            imagePicker.allowsEditing = true
            // 현재 뷰 컨트롤러를 imagePicker로 대체 한다.
            present(imagePicker,animated: true, completion: nil)
            
        }
    }
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
    }
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
    }
    
    func myAlert(_ title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
}

