import UIKit
import Foundation


enum Manufacture: String {
    case bmw, mercedes, kia
}

enum CarAction {
    case turnEngine, openWindows, unloadTrunk
}

struct Car {
    let manufacture: Manufacture
    let releaseYear: Int
    let trunkVolume: Int
    var fullTrunkVolume = true
    mutating func unloadTrunk(on: Bool) {
        fullTrunkVolume = on
        print("Багажник \(manufacture.rawValue) \(on ? "заполнен" : "пуст")")
    }
    let bearingCapacity: Int
    let enginePower: Int
    var isEngineOn = false
    mutating func turnEngine(on: Bool) {
        isEngineOn = on
        print("Двигатель \(manufacture.rawValue) \(on ? "включен" : "выключен")")
    }
    var windowsOpen = true
    mutating func openWindows(on: Bool) {
           windowsOpen = on
           print("Окна \(manufacture.rawValue) \(on ? "открыты" : "закрыты")")
       }
}

struct Truck {
    let manufacture: Manufacture
    let releaseYear: Int
    let trunkVolume: Int
    var fullTrunkVolume = true
    mutating func unloadTrunk(on: Bool) {
        fullTrunkVolume = on
        print("Багажник \(manufacture.rawValue) \(on ? "заполнен" : "пуст")")
    }
    let bearingCapacity: Int
    let enginePower: Int
    var isEngineOn = true
    mutating func turnEngine(on: Bool) {
        isEngineOn = on
        print("Двигатель \(manufacture.rawValue) \(on ? "включен" : "выключен")")
    }
    var windowsOpen = true
    mutating func openWindows(on: Bool) {
        windowsOpen = on
        print("Окна \(manufacture.rawValue) \(on ? "открыты" : "закрыты")")
    }
    
}
var car1 = Car(manufacture: .kia, releaseYear: 2010, trunkVolume: 450, fullTrunkVolume: false, bearingCapacity: 1300, enginePower: 180, isEngineOn: true, windowsOpen: false)
var car2 = Car(manufacture: .bmw, releaseYear: 1993, trunkVolume: 340, fullTrunkVolume: false, bearingCapacity: 1450, enginePower: 320, isEngineOn: true, windowsOpen: true)
var truck1 = Truck(manufacture: .mercedes, releaseYear: 2007, trunkVolume: 1700, fullTrunkVolume: true, bearingCapacity: 2200, enginePower: 140, isEngineOn: false, windowsOpen: false)

car1.openWindows(on: true)
car2.unloadTrunk(on: true)
truck1.openWindows(on: true)

print(car1)
print(car2)
print(truck1)
