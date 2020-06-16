import UIKit

enum Transmission {
    case robot, auto, mech
}
enum Manufacture {
    case bmw, mercedes, kia
}
enum EngineType {
    case electric, diesel, petrol
}
enum StandartWindowCarAction {
    case windowOpen, windowClose
}
enum StandartEngineCarAction {
    case turnEngineOn, turnEngineOff
}

enum SpecialCarActions {
    case sportButtonOn, sportButtonOff, loadTrunk, unloadTrunk
}

protocol Car {
    var color: UIColor {get set}
    var manufacture: Manufacture {get set}
    var transmission: Transmission {get set}
    var enginePower: Int {get set}
    var engineType: EngineType {get set}
    var isEngineOn: Bool {get set}
    var isWindowOpen: Bool {get set}
}
extension Car {
    mutating func standartEngineAction(action: StandartEngineCarAction) {
        switch action {
        case .turnEngineOff:
            guard isEngineOn else {
                print("Двигатель уже выключен")
                return
            }
            isEngineOn = false
            print("Двигатель выключен")
            
        case .turnEngineOn:
            guard !isEngineOn else {
                print("Двигатель уже включен")
                return
            }
            isEngineOn = true
            print("Двигатель  включен")
        }
    }
}
extension Car {
    mutating func standartWindowAction(action: StandartWindowCarAction) {
        switch action {
        case .windowClose:
            guard isWindowOpen else {
                print("Окна уже закрыты")
                return
            }
            isWindowOpen = false
            print("Окна закрыты")
            
        case .windowOpen:
            guard !isWindowOpen else {
                print("Окна уже открыты")
                return
            }
            isWindowOpen = true
            print("Окна открыты")
        }
    }
}

class SportCar: Car {
    var color: UIColor
    var manufacture: Manufacture
    var transmission: Transmission
    var enginePower: Int = 150
    var engineType: EngineType
    var isEngineOn: Bool
    var isWindowOpen: Bool
    var sportButton: Bool
    
    init(sportButton: Bool, color: UIColor, manufacture: Manufacture, transmission: Transmission, enginePower: Int, engineType: EngineType, isEngineOn: Bool, isWindowOpen: Bool) {
        self.color = color
        self.manufacture = manufacture
        self.transmission = transmission
        self.enginePower = enginePower
        self.engineType = engineType
        self.isEngineOn = isEngineOn
        self.isWindowOpen =  isWindowOpen
        self.sportButton = sportButton
    }
    
    func specialActions(action: SpecialCarActions) {
        switch action {
        case .sportButtonOff:
            guard sportButton else {
                print("Кнопка спорт уже выключена")
                return
            }
            sportButton = false
            enginePower = enginePower / 2
            print("Кнопка спорт выключена мощность двигателя \(enginePower)")
            
        case .sportButtonOn:
            guard !isEngineOn else {
                print("Кнопка спорт уже включена")
                return
            }
            sportButton = true
            enginePower = enginePower * 2
            print("Кнопка спорт включена, мощность двигателя увеличина до \(enginePower)")
            
        default:
            print("Действие не поддерживается")
        }
    }
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "------- \r Цвет автомобиля \(color)\r Марка автомобиля \(manufacture)\r Тип трансмиссии \(transmission)\r Мощность двигателя \(enginePower)\r Тип двигателя  \(engineType)\r Кнопка спорт \(sportButton)\r Статус двигателя \(isEngineOn)\r Статус окон \(isWindowOpen) "
    }
}

class TrunkCar: Car {
    var color: UIColor
    
    var manufacture: Manufacture
    
    var transmission: Transmission
    
    var enginePower: Int
    
    var engineType: EngineType
    
    var isEngineOn: Bool
    
    var isWindowOpen: Bool
    
    var trunk: Bool
    
    init(trunk: Bool, color: UIColor, manufacture: Manufacture, transmission: Transmission, enginePower: Int, engineType: EngineType, isEngineOn: Bool, isWindowOpen: Bool) {
        self.color = color
        self.manufacture = manufacture
        self.transmission = transmission
        self.enginePower = enginePower
        self.engineType = engineType
        self.isEngineOn = isEngineOn
        self.isWindowOpen =  isWindowOpen
        self.trunk = trunk
    }
    func specialActions(action: SpecialCarActions) {
        switch action {
        case .unloadTrunk:
            guard trunk else {
                print("Багажник уже разгружен")
                return
            }
            trunk = false
            print("Багажник пуст")
            
        case .loadTrunk:
            guard !trunk else {
                print("Багажник уже загружен")
                return
            }
            trunk = true
            print("Багажник загружен")
            
        default:
            print("Действие не поддерживается")
        }
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "------- \r Цвет автомобиля \(color)\r Марка автомобиля \(manufacture)\r Тип трансмиссии \(transmission)\r Мощность двигателя \(enginePower)\r Тип двигателя  \(engineType)\r Статус багажного отделения \(trunk)\r Статус двигателя \(isEngineOn)\r Статус окон \(isWindowOpen) "
    }
}
var sportCarStinger = SportCar(sportButton: false, color: .white, manufacture: .kia, transmission: .auto, enginePower: 240, engineType: .diesel, isEngineOn: false, isWindowOpen: false)
sportCarStinger.specialActions(action: .sportButtonOn)
sportCarStinger.standartWindowAction(action: .windowOpen)
sportCarStinger.standartEngineAction(action: .turnEngineOn)

print(sportCarStinger)

var trunkCarSprinter = TrunkCar(trunk: false, color: .white, manufacture: .mercedes, transmission: .mech, enginePower: 140, engineType: .diesel, isEngineOn: false, isWindowOpen: false)

trunkCarSprinter.standartWindowAction(action: .windowOpen)
trunkCarSprinter.standartEngineAction(action: .turnEngineOn)
trunkCarSprinter.specialActions(action: .loadTrunk)
print(trunkCarSprinter)












