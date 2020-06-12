import UIKit
import Foundation

enum Transmission {
    case robot, auto, mech
}
enum Manufacture {
    case bmw, mercedes, kia
}
enum EngineType {
    case electric, diesel, petrol
}
enum sportButtonCheck {
    case on, off
}
enum trunkExistCheck {
    case on, off
}

class Car {
    var color: UIColor
    let manufacture: Manufacture
    let transmission: Transmission
    var enginePower: Int
    let engineType: EngineType
    static var carCount = 0
    init(color: UIColor, manufacture: Manufacture, transmission: Transmission, enginePower: Int, engineType: EngineType) {
        self.color = color
        self.manufacture = manufacture
        self.transmission = transmission
        self.enginePower = enginePower
        self.engineType = engineType
        Car.carCount += 1
    }
    static func countInfo(){
        print("------- \rВсего выпущено \(self.carCount) автомобилей")
    }
    func printCarInfo(color: UIColor, manufacture: Manufacture, transmission: Transmission, enginePower: Int, engineType: EngineType) {
        print("------- \r Цвет автомобиля \(color)\r Марка автомобиля \(manufacture)\r Тип трансмиссии \(transmission)\r Мощность двигателя \(enginePower)\r Тип двигателя  \(engineType)")
    }
}

class SportСar: Car {
    var sportButton: sportButtonCheck
    static var sportCarCount = 0
    init(color: UIColor, manufacture: Manufacture,  transmission: Transmission, enginePower: Int = 150, engineType: EngineType, sportButton: sportButtonCheck) {
        self.sportButton = sportButton
        super.init(color: color, manufacture: manufacture, transmission: transmission, enginePower: enginePower, engineType: engineType)
        SportСar.sportCarCount += 1
    }
    static func SportCarCountInfo(){
        print("------- \rВыпущено \(self.sportCarCount) спортивных автомобилей")
    }
    func sportButtonOn() -> Int {
        sportButton = .on
        enginePower = enginePower * 2
        print("Кнопка Sport активна")
        return enginePower
    }
    func sportButtonOff() -> Int {
        sportButton == .off
        enginePower = enginePower
        print("Кнопка Sport не активна")
        return enginePower
    }
    override func printCarInfo(color: UIColor, manufacture: Manufacture, transmission: Transmission, enginePower: Int, engineType: EngineType) {
        super.printCarInfo
        if sportButton == .on {
            print("------- \r Цвет автомобиля \(color) \r Марка автомобиля \(manufacture)\r Тип трансмиссии \(transmission) \r Кнопка спорт активна, мощность двигателя увеличина до \(enginePower) \r Тип двигателя  \(engineType)")
        } else if sportButton == .off {
            print("------- \r Цвет автомобиля \(color)\r Марка автомобиля \(manufacture)\r Тип трансмиссии \(transmission)\r Кнопка спорт не активна, мощность двигателя \(enginePower)\r Тип двигателя  \(engineType)")
        }
    }
}

class TrunkCar: Car {
    var trunk: trunkExistCheck
    init(color: UIColor, manufacture: Manufacture, transmission: Transmission, enginePower: Int, engineType: EngineType, trunk: trunkExistCheck) {
        self.trunk = trunk
        super.init(color: color, manufacture: manufacture, transmission: transmission, enginePower: enginePower, engineType: engineType)
    }
    func trunkExistCheckOn() {
        trunk = .on
        print("Багажник установлен")
    }
    func trunkExistCheckOff() {
        trunk = .off
        print("Багажник не установлен")
    }
    
    override func printCarInfo(color: UIColor, manufacture: Manufacture, transmission: Transmission, enginePower: Int, engineType: EngineType) {
        super.printCarInfo
        if trunk == .on {
            print("------- \r Цвет автомобиля \(color)\r Марка автомобиля \(manufacture) \r Тип трансмиссии \(transmission) \r Мощность двигателя \(enginePower) \r Тип двигателя  \(engineType) \r Прицеп подсоединен")
        } else if trunk == .off {
            print("------- \r Цвет автомобиля \(color)\r Марка автомобиля \(manufacture)\r Тип трансмиссии \(transmission) \r Мощность двигателя \(enginePower) \r Тип двигателя  \(engineType) \r Прицеп не подсоединен")
        }
        
    }
}

let car1 = Car(color: .black, manufacture: .bmw, transmission: Transmission.auto, enginePower: 200, engineType: EngineType.electric)
let sportCar1 = SportСar(color: .black, manufacture: .bmw, transmission: .auto, engineType: .diesel, sportButton: .off)
let sportCar2 = SportСar(color: .white, manufacture: .bmw, transmission: .mech, enginePower: 200, engineType: .electric, sportButton: .off)
let trunkCar1 = TrunkCar(color: .black, manufacture: .mercedes,  transmission: .mech, enginePower: 120, engineType: EngineType.diesel, trunk: .off)
let trunkCar2 = TrunkCar(color: .brown, manufacture: .mercedes, transmission: .robot, enginePower: 132, engineType: .diesel, trunk: .off)

sportCar1.sportButtonOff()
sportCar2.sportButtonOn()

trunkCar1.trunkExistCheckOn()

car1.printCarInfo(color: car1.color, manufacture: car1.manufacture, transmission: car1.transmission, enginePower: car1.enginePower, engineType: car1.engineType)
sportCar1.printCarInfo(color: sportCar1.color, manufacture: sportCar1.manufacture, transmission: sportCar1.transmission, enginePower: sportCar1.enginePower, engineType: sportCar1.engineType)
sportCar2.printCarInfo(color: sportCar2.color, manufacture: sportCar2.manufacture, transmission: sportCar2.transmission, enginePower: sportCar2.enginePower, engineType: sportCar2.engineType)
trunkCar1.printCarInfo(color: trunkCar1.color, manufacture: trunkCar1.manufacture, transmission: trunkCar1.transmission, enginePower: trunkCar1.enginePower, engineType: trunkCar1.engineType)
trunkCar2.printCarInfo(color: trunkCar2.color, manufacture: trunkCar2.manufacture, transmission: trunkCar2.transmission, enginePower: trunkCar2.enginePower, engineType: trunkCar2.engineType)
Car.countInfo()
SportСar.SportCarCountInfo()
