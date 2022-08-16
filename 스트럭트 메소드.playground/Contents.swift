import UIKit

struct Friend {
    
    var age : Int
    
    var name : String
    
    func sayHello() -> String {
        print("satHellow()")
        return "저는 \(age)살, \(name) 입니다."
    }
}

var myFriend = Firend(age : 10, name : "이대규")

myFriend.sayHello()
