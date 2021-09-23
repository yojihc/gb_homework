import Cocoa

// -x^2 + 6x + 7 = 0

let a: Double = -1
let b: Double = 6
let c: Double = 7

var x1: Double = 0
var x2: Double = 0
var D: Double = 0

D = b * b - 4 * a * c  //64

if  D > 0 {
    x1 = (-b + sqrt (D)) / 2 * a
    x2 = (-b - sqrt (D)) / 2 * a
    print("X1 = \(x1)", "X2 = \(x2)") }

else if D == 0 {
    x1 = (-b + sqrt(D)) / 2 * a
    print("No Roots")
}

