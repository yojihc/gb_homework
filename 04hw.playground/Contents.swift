

class Car {
    let brand: String
    let productionYear: Int
    var engine: EngineStatus = .off
    var window: WindowsStatus = .closed
    
    enum EngineStatus: CustomStringConvertible{
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Engine Start"
            case .off:
                return "Engine Stop"
            }
        }
    }
    
    enum WindowsStatus: CustomStringConvertible {
        case open, closed
        
        var description: String {
            switch self {
            case .open:
                return "Windows Open"
            case .closed:
                return "Windows Closed"
            }
        }
    }
    
    enum TruckBodyType: CustomStringConvertible {
        case box, tank, refgirerator
        
        var description: String {
            switch self {
            case .box:
                return "Standart Cabin"
            case .tank:
                return "Cistern"
            case .refgirerator:
                return "Cold Camera"
            }
        }
    }
    
    enum Action {
        case switchEngine(EngineStatus)
        case switchWindow(WindowsStatus)
        case loadCargo(Double)
        case attachTruckBody(TruckBodyType)
        case replaceTyres
    }
    
    init(brand: String, productionYear: Int) {
        self.brand = brand
        self.productionYear = productionYear
        }
    
    func perform(action: Action) {
        
    }
}

class TrunkCar: Car, CustomStringConvertible {
    static var typeEmoji = "🚚"
    let maxCargoSpace: Double
    var currentCargoSpace: Double = 0
    var body: TruckBodyType?
    
    var description: String {
        let bodyDescription = body?.description ?? "Disconnected"
        return "\(TrunkCar.typeEmoji) \(brand) \nYear prodaction: \(bodyDescription) \(currentCargoSpace) / \(maxCargoSpace) \nStatus \(engine) | \(window)\n"
    }
    init(brand: String, productionYear:Int, maxCargoSpace: Double, body:TruckBodyType?) {
        self.body = body
        self.maxCargoSpace = maxCargoSpace
        super.init(brand: brand, productionYear: productionYear)
    }
    override func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindow(let status):
            window = status
        case .loadCargo(let load):
            guard body != nil else {
                return
            }
        
    
    let expectedLoad = load + currentCargoSpace
    switch expectedLoad {
    case _ where expectedLoad > maxCargoSpace:
        currentCargoSpace = maxCargoSpace
        
    case _ where expectedLoad < 0:
        currentCargoSpace = 0
    default:
        currentCargoSpace += load
    }
        case .attachTruckBody(let newBody):
            self.body = newBody
            currentCargoSpace = 0
        default:
            break
    }
  }
}

class sportCar: Car, CustomStringConvertible {
    
    var typeEmoji = "🚙"
    var zeroToHundredAcceleration: Double = 0.0
    var topSpeed: Int = 0
    
    var description: String {
        return "\(typeEmoji) \(brand) \nYear of prodaction \(productionYear) \nAcceleration 0-100km/h \(zeroToHundredAcceleration) with\nMax speed: \(topSpeed) km/h \nStatus Car: \(engine) | \(window)\n" }
    
    init(brand: String, productionYear: Int, zeroToHundredAcceleration: Double, topSpeed: Int) {
        self.zeroToHundredAcceleration = zeroToHundredAcceleration
        self.topSpeed = topSpeed
        super.init(brand: brand, productionYear: productionYear)
    }
//    init(brand: String, productionYear: Int, zeroToHundredAcceleration: Double, topSpeed: Int) {
//        self.zeroToHundredAcceleration = zeroToHundredAcceleration
//        self.topSpeed = topSpeed
//        super.init(brand: brand, productionYear: productionYear)
    
    override func perform(action: Action) {
    switch action {
    case .switchEngine(let status):
        engine = status
    case .switchWindow(let status):
        window = status
    case .replaceTyres:
        print("Tyres will be replaced!")
    default:
        break
    }
   }
}
var manTruck = TrunkCar(brand: "MAN", productionYear: 2019, maxCargoSpace: 3000, body: nil)
manTruck.perform(action: .attachTruckBody(.tank))
manTruck.perform(action: .loadCargo(1500))
manTruck.perform(action: .switchEngine(.on))
print(manTruck)

var ferrari = sportCar(brand: "Kamaz", productionYear: 2017, zeroToHundredAcceleration: 3.4, topSpeed: 325)
ferrari.perform(action: .switchWindow(.closed))
ferrari.perform(action: .replaceTyres)
ferrari.perform(action: .switchEngine(.on))
print(ferrari)
