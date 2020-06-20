import UIKit

protocol Material {
    var strength: Int { get }
}

class Support: Material, CustomStringConvertible {
    var length: Int
    var strength: Int {
        return length * 8
    }
    init(length: Int) {
        self.length = length
    }
    var description: String {
        return "Длинна балки \(length), прочность \(strength)"
    }
}

class Block: Material, CustomStringConvertible {
    var length: Int
    var strength: Int {
        return (length * 6) + 4
    }
    init(length: Int) {
        self.length = length
    }
    var description: String {
        return "Длинна блока \(length), прочность \(strength)"
    }
}

struct Queue<T: Material>: CustomStringConvertible {
    var list = [T]()
    var description: String {
        return "\(list)"
    }
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    mutating func dequeue() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    func peek() -> T? {
        if !list.isEmpty {
            return list[0]
        } else {
            return nil
        }
    }
    var isEmpty: Bool {
        return list.isEmpty
    }
    subscript (indexes: [Int]) -> Int? {
        var strength = 0
        for i in indexes  where i < list.count {
            
            strength += list[i].strength
        }
            return strength
        }
    }


var arrayBlocks = [10, 11, 12, 13, 14, 15, 16]
let manyBlocks = arrayBlocks.map{ Block(length: Int($0))}
print(manyBlocks)

var arraySupports = [2, 3, 4, 5, 6, 7, 8]
let manySupports = arraySupports.map{Support(length: Int($0))}
print(manySupports)

let filterBlocks = manyBlocks.filter{ $0.strength > 80 }
print(filterBlocks)

let filterSupports = manySupports.filter{ $0.strength > 40}
print(filterSupports)

var test = Queue<Block>()
test.enqueue(Block.init(length: 10))
test.enqueue(Block.init(length: 2))
test.enqueue(Block.init(length: 3))
test.enqueue(Block.init(length: 4))
print(test)
print(test[[1, 2]])



