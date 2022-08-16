import UIKit

class Friend {
    var name : String
    
    init(_ name: String){
        self.name = name
    }
    
    func sayHi(){
        print("안녕?! 난 \(self.name) 라고 해")
    }
}

// Friend를 상속(Override_덮어쓴다)
class BestFriend : Friend {
    
    // override로 부모의 메소드를 가져왔다.
    override init(_ name: String) {
        // super 로 부모의 메소드 사용
        super.init("베프 " + name)
    }
    
    override func sayHi() {
        super.sayHi()
    }
}

let myFirend = Friend("쩡대리")

myFirend.sayHi()

let myBestFriend = Friend("영희")

myBestFriend.sayHi()
