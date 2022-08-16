import UIKit

// String을 반환하는 클로저
let myName : String = {
    // myName 으로 들어간다
    return "정대리"
}()

print(myName)

//클로저 정의 - 클로저 = 메소드와 동일
let myRealName : (String) -> String = {(name: String) -> String in
    return "개발하는 \(name)"
}

myRealName("쩡대리")

let myRealnameLogic : (String) -> Void = {(name: String) in
    print("개발하는 \(name)")
    
}

myRealnameLogic("정대리 호롤로로")
