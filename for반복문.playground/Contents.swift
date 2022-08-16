import UIKit

// range 레인지
// 0...5
// 0,1,2,3,4,5

// 0..<5 0부터 5보다 작을때 까지
// 0,1,2,3,4

//for index in 0...5 {
//    print("호호 index: \(index)")
//}

//for index in 0..<5 {
//    print("호호 index: \(index)")
//}

for index in 0..<5 where index % 2 == 0{
    print("호호 짝수 index: \(index)")
}

//var randomInts:[Int] = []
var randomInts:[Int] = [Int]()

for _ in 0..<25 {
    let randomNumber = Int.random(in: 0...100)
    randomInts.append(randomNumber)
}

print("randomInts: \(randomInts)")
