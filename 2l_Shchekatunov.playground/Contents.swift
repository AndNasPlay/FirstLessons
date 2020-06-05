import UIKit
// 1 Написать функцию, которая определяет, четное число или нет.
let number: Int = 12
func evenTest (testNumber: Int) {
    if (testNumber % 2) == 0 {
        print("Число \(testNumber) четное")
    } else {
        print("Число \(testNumber) нечетное")
    }
}
evenTest(testNumber: number)

// 2 Написать функцию, которая определяет, делится ли число без остатка на 3
func DeleteOnthree (testNumber: Int) {
     if (testNumber % 3) == 0 {
            print("Число \(testNumber) делится на 3 без остатка")
        } else {
            print("Число \(testNumber) не делится на 3 без остатка")
        }
    }
DeleteOnthree(testNumber: number)


// 3 Создать возрастающий массив из 100 чисел.
var augmentingArray: [Int] = []
for i in 1...100 {
    augmentingArray.append(i)
}
print(augmentingArray)

// 4 Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func deleteEvenNoDelOnthree (testArray: [Int]) {
    var NewArray: [Int] = []
    for (index, value) in testArray.enumerated() {
        if (value % 2) != 0, (value % 3) == 0 {
            NewArray.append(value)
        }
    }
    print(NewArray)
}
deleteEvenNoDelOnthree(testArray: augmentingArray)

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func fibonacciNumbers (Allnumbers: Int) {
    var f: Double = 0
    var number1: Double = 1
    var number2: Double = 1
    var fibonacciArr: [Double] = []
    if Allnumbers == 0  {
        fibonacciArr.append(0)
    } else if Allnumbers == 1 {
        fibonacciArr.append(0)
        fibonacciArr.append(1)
    } else if Allnumbers >= 2 {
        fibonacciArr.append(0)
        fibonacciArr.append(1)
        fibonacciArr.append(1)
        for _ in 2...Allnumbers {
            f = number1 + number2
            number1 = number2
            number2 = f
            fibonacciArr.append(f)
        }
    }
    print(fibonacciArr)
}
fibonacciNumbers(Allnumbers: 100)

//* Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
func checkSimpleNumber (allNumbers:Int) {
    var primeNumber: [Int] = []
    for p in 2...allNumbers {
        if (p % 2 == 0 && 2 < p) || (p % 3 == 0 && 3 < p) || (p % 5 == 0 && 5 < p) || (p % 7 == 0 && 7 < p){
        }else{
            primeNumber.append(p)
        }
    }
    print(primeNumber)
}
checkSimpleNumber(allNumbers: 310)

