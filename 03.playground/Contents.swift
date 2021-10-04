import Foundation


// Состояние двигателя автомобиля
enum engineStatus: String {
    case on = "двигатель работает"
    case off = "двигатель не работает"
}

// Состояние окон автомобиля
enum windowsStatus: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

// Состояние багажника    // Не выводит значение в ковычках??
enum trunkStatus: String {
    case full = "заполнен"
    case empty = "пуст"
}


struct car {
    var carBrand: String
    var yearOfRealese: Int
    var engine: engineStatus
    var windows: windowsStatus
    var trunk: trunkStatus
    var fullTrunk: Double // Максимальное значение багахника
    
    
    
    //метод который меняет вкл на выкл двигателя
    mutating func onEngine(action: engineStatus) {
        switch action { //создаем действие
        case .off: // действие 1 выкл
            print(action.rawValue) 
                  self.engine = .off
            
        case .on:
            print(action.rawValue)
            self.engine = .on
        }
    }
    
    func printEngine() {
        print(engine.rawValue)
    }
   /* // метод который меняет значение открыто закрыто - почему его не делаем? - !!!!!
    mutating func onWindow(action: windowsStatus) {
        switch action {
        case .close:
            print(action.rawValue)
            self.windows = .close
            
        case  .open:
            print(action.rawValue)
            self.windows = .open
        }
    }
    
    //метод который определяет статус багажника
    */
    
    func description () {
        print("Автомобиль  \(carBrand), \(yearOfRealese) года выпуска. Сейчас  \(engine.rawValue). Состояние багажника на данный момент: \(trunk). Максимальный объем багажника \(fullTrunk)")
    }
}

var car1 = car(carBrand: "Volvo", yearOfRealese: 2018, engine: .off, windows: .close, trunk: .empty, fullTrunk: 500)

var car2 = car(carBrand: "VW", yearOfRealese: 2000, engine: .on, windows: .open, trunk: .full , fullTrunk: 250)



struct truck {
    var carBrand: String
    var yearOfRealese: Int
    var engine: engineStatus
    var windows: windowsStatus
    var trunk: trunkStatus
    var fullTrunk: Double // Максимальное значение багахника
    
    
    
    //метод который меняет вкл на выкл двигателя
    mutating func onEngine(action: engineStatus) {
        switch action { //создаем действие
        case .off: // действие 1 выкл
            print(action.rawValue)
                  self.engine = .off
            
        case .on:
            print(action.rawValue)
            self.engine = .on
        }
    }
    
    func printEngine() {
        print(engine.rawValue)
    }
    
    func description () {
        print("Автомобиль  \(carBrand), \(yearOfRealese) года выпуска. Сейчас двигатель \(engine.rawValue).  Кузов сейчас: \(trunk). Максимальный объем кузова \(fullTrunk)")
    }
}


var truck1 = truck(carBrand: "TATRA", yearOfRealese: 1980, engine: .on, windows: .open, trunk: .full, fullTrunk: 2000)
var truck2 = truck(carBrand: "DAF", yearOfRealese: 1955, engine: .off, windows: .close, trunk: .empty, fullTrunk: 2350)


car1.carBrand
car1.yearOfRealese
car1.windows
car2.onEngine(action: .off)
car2.onEngine(action: .on)

car2.description()

truck1.carBrand
truck1.yearOfRealese
print(truck1.trunk)
truck1.printEngine()
truck1.windows

truck1.description()

