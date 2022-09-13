//
//  DetailViewController.swift
//  Table1
//
//  Created by 이대규 on 2022/09/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MainView에서 받을 텍스트를 위해 변수 receiveItem을 선언한다.
    var receiveItem = ""

    @IBOutlet var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 뷰가 노출될 때마다 이 내용을 레이블의 텍스트로 표시한다
        lblItem.text = receiveItem
    }
    
    // MainView에서 변수를 받기위한 함수를 추가한다.
    func receiveItem( _ item: String){
        receiveItem = item
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
