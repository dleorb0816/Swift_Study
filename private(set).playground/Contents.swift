import UIKit

struct MyPet{
    
    var name : String = "타이틀없음"
    
    private (set) var name : String = "이름 없음"
    
    mutating func setName(to newName: String){
        self.name = newName
    }
}

var myPet = MyPet()
myPet.name
myPet.title
