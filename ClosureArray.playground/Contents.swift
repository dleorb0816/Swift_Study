import UIKit



let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversed)

let names2 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let reversed2 = names2.sorted(by: { (s1: String, s2: String) -> Bool in
                             return s1 > s2
})

print(reversed2)
