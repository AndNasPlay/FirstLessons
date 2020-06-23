import UIKit

struct Car {
    var price: Int
    var count: Int
    var models: Models
    var equipment: Equipment
    let product: Product
    
}
struct Product{
    let name: String
}

enum Models {
    case Sportage, Stinger, Ceed
}
enum Equipment {
    case Comfort, Luxe, Prestige
}
enum FactoryError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(cashNeeded: Int)
}

class Factory {
    var stock = ["Sportage Comfort":Car(price: 12000, count: 20, models: .Sportage, equipment: .Comfort, product: Product(name: "Sportage Comfort")),
                 "Sportage Luxe":Car(price: 14000, count: 20, models: .Sportage, equipment: .Luxe, product: Product(name: "Sportage Luxe")),
                 "Stinger Luxe":Car(price: 20000, count: 10, models: .Stinger, equipment: .Luxe, product: Product(name: "Stinger Luxe")),
                 "Ceed Prestige":Car(price: 8000, count: 40, models: .Ceed, equipment: .Prestige, product: Product(name: "Ceed Prestige"))
    ]
    var cash = 0
    func carPurchase(carModel name: String) throws -> (Product?, FactoryError?) {
        guard let Car = stock[name] else {
            throw FactoryError.invalidSelection
            
        }
        guard Car.count > 0 else {
            throw FactoryError.outOfStock
        }
        guard Car.price <= cash else {
            throw FactoryError.insufficientFunds(cashNeeded: Car.price - cash)
        }
        cash -= Car.price
        var newCar = Car
        newCar.count -= 1
        stock[name] = newCar
        return newCar.product
    }
}


