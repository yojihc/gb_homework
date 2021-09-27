import Cocoa



//01
var a = 6
func even() {
    if a % 2 == 0 {
        print("Число", a, "четное") }
    else {
        print("Число", a, "не четное")
    }
}
print("Task_01")
even()
print("________________________________________________________________________")

    //02
var a1 = 5
print("Task_02")
func num() {
    if a1 % 3 == 0 {
        print("Число", a1, "делится на", 3) }
    else {
        print("Число", a1, "не делится на", 3)
    }
}
num()
print("________________________________________________________________________")

    //03-04
var arr: [Int] = []
for i in 0...100{
    if i % 3 != 0 && i % 2 != 0{
        arr.append(i)
    }
}
print("Task_03-04")
print(arr)
print("________________________________________________________________________")
    //05
func fb (n: Int) -> (Decimal) {
    if (n < 3) {
        return 1
    } else {
        var x: Decimal = 1, y: Decimal = 1, z: Decimal
        for _ in 3...n {
            z = x + y
            x = y
            y = z
        }
        return y
    }
}
var fibArray = [Decimal]()
fibArray.append(0)
var n  = 50
for i in 1...n {
    fibArray.append(fb(n: i))
}
print("Task_05")
print(fibArray)
print("________________________________________________________________________")
    //06
func Simple (num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
func SimpleArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Simple(num: i) {
            results.append(i)
        }
        i += 1
    }
    
    return results
}
print("Task_06")
print (SimpleArray())
print("________________________________________________________________________")
