//
//  AddViewController.swift
//  Table1
//
//  Created by 이대규 on 2022/09/05.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        // items에 텍스트 필드의 텍스트 값을 추가한다.
        items.append(tfAddItem.text!)
        // itemsImageFile에는 무조건 'pencil.png' 파일을 추가한다
        itemsImageFile.append("pencil.png")
        // 텍스트 필드의 내용을 지운다
        tfAddItem.text=""
        // 루트 뷰 컨트롤러, 즉 테이블 뷰로 돌아간다.
        _ =  navigationController?.popViewController(animated: true)
        
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
