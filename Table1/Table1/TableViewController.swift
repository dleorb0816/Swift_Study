//
//  TableViewController.swift
//  Table1
//
//  Created by 이대규 on 2022/09/05.
//

import UIKit

var items = ["책 구매","철수와 약속","스터디 준비하기"]
var itemsImageFile = ["lamp_off.png","lamp_on.png","pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    // 뷰가 로드 되었을때 호출 되는 함수로, 뷰가 생성될때 한번만 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // tvLiseView.reloadData 함수를 추가하여 테이블 뷰를 다시 불러온다. 다시 말해 추가된 내용을 목록으로 불러들인다.
    // viewWillAppear => 뷰가 완전히 보인 후 호출되는 함수로, 뷰가 완전히 보인 후 호출 된다.
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // 보통은 테이블 안에 섹션이 한 개이므로 number Of Sections의 리턴 값을 1로 한다.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 섹션당 열의 개수는 Items의 개수 이므로 tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int 함수의 리턴 값을 items.count로 한다.
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // 셀의 텍스트 레이블에 앞에서 선언한 items을 대입,그내용은 "책 구매","철수와 약속", "스터디 준비하기"이다
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        
        // 셀의 이미지 뷰에 앞에서 선언한 itemsImageFile("cart.png","clock.png","pencil.png")을 대입한다.
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String {
        // Return false if you do not want the specified item to be editable.
        return "삭제"
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 아이템의 위치를 itemToMove에 저장한다
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        // 이동할 아이템의 이미지를 itemImageToMove에 저장한다
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        // 이동할 아이템을 삭제한다. 이때 삭제한 아이템 뒤의 아이템들의 인덱스가 재정렬된다.
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        // 이동할 아이템의 이미지를 삭제한다. 이때 삭제한 아이템 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬 된다.
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        // 삭제한 아이템을 이동할 위치로 삽입한다. 또한 삽입한 아이템 뒤의 아이템들의 인덱스가 재정렬된다.
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        // 삭제된 아이템의 이미지를 이동할 위치로 삽입합니다. 또한 삽입한 아이템 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬된다.
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // 책 11 - 5절 참고
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }
    

}
