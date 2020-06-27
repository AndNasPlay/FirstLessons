import UIKit

struct Car {
    var price: Int
    var count: Int
    var equipment: Equipment
    let product: Product
    
}
struct Product{
    let name: Model
}
enum Model {
    case Sportage, Ceed
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
    private var stock = ["Sportage Comfort": Car(price: 10000, count: 3, equipment: .Comfort, product: Product(name: .Sportage)),
                         "Sportage Luxe": Car(price: 12000, count: 2, equipment: .Luxe, product: Product(name: .Sportage)),
                         "Ceed Prestige": Car(price: 9000, count: 10, equipment: .Prestige, product: Product(name: .Ceed))
    ]
    var cash = 0
    func vend(carModel name: String) throws -> Product {
        guard let car = stock[name] else {
            throw FactoryError.invalidSelection
        }
        
        guard car.count > 0 else {
            throw FactoryError.outOfStock
        }
        
        guard car.price <= cash else {
            throw FactoryError.insufficientFunds(cashNeeded: car.price - cash )
        }
        
        cash -= car.price
        var newCar = car
        newCar.count -= 1
        stock[name] = newCar
        
        print("Вы купили \(name) остаток средств \(cash) ")
        return newCar.product
    }
}
let BuyCar = Factory()
do {
    BuyCar.cash = 20000
    try BuyCar.vend(carModel: "Sportage Luxe")
}
catch FactoryError.outOfStock{
    print("Товар закончился на складе")
}
catch FactoryError.invalidSelection {
    print("Такая комплектация отсутствует")
}
catch FactoryError.insufficientFunds(let cashNeeded) {
    print("Недостаточно средств, доплатите \(cashNeeded)")
}
catch let error {
    print(error.localizedDescription)
}


