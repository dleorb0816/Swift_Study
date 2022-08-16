import UIKit

// 유튜버 (데이터) 모델 - struct / 구조체
struct YoutuberStruct {
    var name : String
    var subscribersCount : Int
}

var devJeong = YoutuberStruct(name: "이대규", subscribersCount: 9999)

// devJeong을 devJeongClone에 복사하는 개념 스트럭트
var devJeongClone = devJeong

print("값 넣기 전 devJeongClone.name : \(devJeongClone.name)")

devJeongClone.name = "호롤롤로"

print("값 넣은 후 devJeongClone.name : \(devJeongClone.name)")
print("값 넣은 후 devJeong.name : \(devJeong.name)")

// 클래스 : 생성자를 만들어 줘야함
class YoutuberClass {
    var name : String
    var subscribersCount : Int
    // 생성자 - 즉 메모리에 올린다
    // init 으로 매개변수를 가진 생성자 메소드를 만들어야
    // 매개변수를 넣어서 그값을 가진 객체()를 만들수 있다.
    init(name : String, subscribersCount: Int){
        self.name = name
        self.subscribersCount = subscribersCount
    }
}

var JeongDaeRi = YoutuberClass(name: "이대규", subscribersCount: 9999)
var JeongDaeRiClone = JeongDaeRi

print("값 넣기 전 JeongDaeRiClone.name : \(JeongDaeRiClone.name)")

JeongDaeRiClone.name = "호롤롤로2"

print("값 넣은 후 JeongDaeRiClone.name : \(JeongDaeRiClone.name)")
print("값 넣은 후 JeongDaeRi.name : \(JeongDaeRi.name)")
