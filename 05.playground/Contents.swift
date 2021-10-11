import UIKit

protocol Car {
    func canDrive() -> Bool
}

class sportCar: Car {
    var wheels: Int
    var stateEngine: Bool
    var brand: String
    
    init(wheels: Int, stateEngine: Bool, brand: String) {
    self.wheels = wheels
        self.stateEngine = stateEngine
        self.brand = brand
}
    func canDrive() -> Bool {
        if wheels != 4 {
            print("У вас нехватает колес")
            return false
        } else {
            print("Все колеса на месте! Вы можете ехать!")
            return true
        }
    }
}

class trunkCar: Car {
    var maxFillTrunk: Int
    var fillTrunk: Int
    
    init(maxFillTrunk: Int, fillTrunk: Int){
        self.maxFillTrunk = maxFillTrunk
        self.fillTrunk = fillTrunk
    }
    
    func difFill() {
        let difFill = maxFillTrunk - fillTrunk
        print("У вас свободно \(difFill) кг до полного заполнения багажника")
    }
    
    func canDrive() -> Bool {
        if fillTrunk <= maxFillTrunk{
            print("Вы не перегружены и можете ехать")
            return true
        } else {
            print("У Вас перегруз! СТОП")
            return false
        }
    }
}

extension sportCar {
    func doesWorkCar() -> Bool {
    if stateEngine == true {
        print("Двигатель работоспособен")
        return true
    } else {
        print("Двигатель неработоспособен")
        return false
    }
  }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return String (describing: brand)
    }
}

let car1 = sportCar(wheels: 4, stateEngine: true, brand: "KIA")
let car2 = sportCar(wheels: 3, stateEngine: false, brand: "BMW")
car1.canDrive()
car1.stateEngine
car1.brand
car1.wheels
car2.brand
car2.stateEngine
car2.wheels

let tcar1 = trunkCar(maxFillTrunk: 2500, fillTrunk: 2200)
let tcar2 = trunkCar(maxFillTrunk: 2500, fillTrunk: 2800)
tcar1.difFill()
tcar1.canDrive()
tcar2.canDrive()

