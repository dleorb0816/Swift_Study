import UIKit

var myNumberSet : Set<Int> = Set<Int>()

myNumberSet.insert(1)
myNumberSet.insert(2)
myNumberSet.insert(2)
myNumberSet.insert(3)
myNumberSet.insert(3)

myNumberSet.count
myNumberSet     // 빌드 할때마다 순서가 달라짐

for aNumber in myNumberSet {
    print("aNumber: ", aNumber)
}

var myFriends : Set<String> = ["철수", "영희","수지"]
var myBestFriends : [String] = ["철수", "영희","수지"]

myFriends.contains("철수")    // True
myFriends.contains("쩡대리")   // False
myBestFriends.contains("쩡대리")   // False

// 수지의 Set 인덱스를 가져온다
if let indexToRemove = myFriends.firstIndex(of: "수지") {
    // 수지를 지운다
    print("indexToRemove: ", indexToRemove)
    myFriends.remove(at: indexToRemove)
}

if !myFriends.contains("수지") {
    print("내 친구중에 수지가 없다...")
}


