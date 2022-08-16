import UIKit

class MyFriend {
    var name : String
    
    init(_ name: String = "이름없음"){
        self.name = name
        print("MyFirend 가 메모리에 올라갔다.")
    }
    
    deinit{
        print("메모리에서 사라짐 - : ", self.name)
    }
    
    // deinit 검증을 위해 작성
    var calledTimes = 0
    var MAX_TIMES = 5
    
    static var instancesOfSelf = [MyFriend]()
    class func destorySelf(object: MyFriend){
        instancesOfSelf = instancesOfSelf.filter{ (aFriend : MyFriend)
            aFriend !== object
        }
    }
    
    func call(){
        calledTimes += 1
        print("called \(calledTimes)")
        if calledTimes > MAX_TIMES {
            MyFriend.destorySelf(object: self)
        }
    }
}

let myFriend = MyFriend("쩡대리")
let aFriend = MyFriend()

// Unmanaged.passUnretained(객체).toOpaque()
// 로 해당 객체의 메모리 주소를 프린트 할수 있다

let anObjectMemoryAddress = Unmanaged.passUnretained(aFriend).toOpaque()

let secondMemoryAddress = Unmanaged.passUnretained(myFriend).toOpaque()

print(anObjectMemoryAddress)

print(secondMemoryAddress)

weak var aFirendToBoDestroyied = MyFriend("개발하는 정대리")

if aFirendToBoDestroyied != nil {
    aFirendToBoDestroyied!.call()
} else {
    print("객체가 더이상 메모리에 없습니다")
}

