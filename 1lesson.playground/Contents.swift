import UIKit

//1 Решить квадратное уравнение.
let a: Float = 3.0
let b: Float = -12.0
let c: Float = 10.0
var x1: Float = 0.0
var x2: Float = 0.0
var D = pow(b,2) - (4 * a * c)
if (D < 0 ) {
    print("У уравнения нет действительных корней")
} else if (D == 0) {
    x1 = (-b) / (2 * a)
    print(x1)
} else {
    x1 = (-b + sqrt(D)) / (2 * a)
    x2 = (-b - sqrt(D)) / (2 * a)
    print(x1)
    print(x2)
}

// 2 Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let AC: Float = 2.0
let BC: Float = 4.0
var AB = sqrt(pow(AC,2) + pow(BC,2))
print("Гипотенуза = ", AB)
var S = (BC * AC) / 2
print("Площадь треугольника ", S)
var P = AC + BC + AB
print("Периметр треугольника ", P)

// 3 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var sum: Double = 150000
let firstsum = sum
let allyear: UInt = 5
let procent: Double = 10
for i in 1...allyear {
    sum = ((sum / 100) * procent) + sum
}
print("Итого ", firstsum ," под ", procent, "% годовых через 5 лет превратятся в ", sum)
