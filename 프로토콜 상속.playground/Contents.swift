import UIKit

protocol Naming {
    var name: String {get set}
    func getName() -> String
}


protocol Aging {
    var age: Int {get set}
}
protocol UserNotifiable : Naming, Aging {
    
}

class MyBestFriend: UserNotifiable{
    var name: String
    
    func getName() -> String {
        <#code#>
    }
    
    var age: Int
    
    
}

struct MyFriend : UserNotifiable {
    var name: String
    
    func getName() -> String {
        <#code#>
    }
    
    var age: Int
    
    
}
