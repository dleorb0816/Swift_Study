import UIKit

enum MismatchError: Error {
    case nameMismatch
    case numberMismatch
}

// 에러를 던지는 메소드
func guessMyName(name input: String ) throws {
    print("guessMyName() called")
    if input != "쩡대리" {
        print("틀렸다")
        throw MismatchError.nameMismatch
//        return
    }
    print("맞췄다")
}


/// 번호를 맞춘다
/// - Parameter input: 사용자 숫자 입력
/// - Returns: bool 맞췄는지 여부
func guessMyNumber(number input: Int ) throws -> Bool {
    print("guessMyName() called")
    
    if input != 10 {
        print("틀렸다")
        throw MismatchError.numberMismatch
//        return
    }
    print("맞췄다")
    reture true
}

//try? guessMyName(name: "쩡대리") // 에러가 들어와도 받지 않겠다

//try! guessMyName(name: "이대리")// 에러가 무조건 없을것이다 에러가 던져지면 문제가 생김

//do {
//    try guessMyName(name: "이대리")
//} catch {
//    print("잡은 에러: \(error)")
//}

do {
    let receivedValue = try guessMyNumber(number: 9)
} catch {
    print("잡은 에러: \(error)")
}
