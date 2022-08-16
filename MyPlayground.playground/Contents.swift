import UIKit



struct MyArray<SomeElement>{
    
    // 제네릭을 담은 빈 배열
    var elements = [SomeElement]()
    
    //생성자 메소드
    init(_ elements: [SomeElement]){
        self.elements = elements
    }
}

struct Friend{
    var name: String
}

struct PpatCoder{
    var name: String
}

var mySomeArray = MyArray([1,2,3])
print("mySomeArray = \(mySomeArray)")

var mySomeArray2 = MyArray(["가","나","다"])
print("mySomeArray2 = \(mySomeArray2)")

let friend_01 = Friend(name:"김경섭")
let friend_02 = Friend(name:"윤중원")
let friend_03 = Friend(name:"김민호")

var myFriendsArray = MyArray([friend_01,friend_02,friend_03])
print("myFriendsArray = \(myFriendsArray)")
