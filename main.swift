//
//  main.swift
//  calculator-v2
//
//  Created by Wei-Jen Chiang on 4/7/16.
//  Copyright © 2016 Wei-Jen Chiang. All rights reserved.
//

import Foundation

/* Build a calculator */
func add (num1 : Int, num2 : Int) -> Int { return num1 + num2 }

func subtract (num1: Int, num2: Int) -> Int { return num1 - num2 }

func multiply (num1: Int, num2: Int) -> Int { return num1 * num2 }

func divide (num1: Int, num2: Int) -> Int { return num1 / num2 }

func mathOp (num1 : Int, num2: Int, op : (Int, Int) -> Int) -> Int {
    return op(num1, num2);
}

// examples - add
print("examples: add")
print("3 + 4 = \(mathOp(3, num2: 4, op: add))")
print("5 + 0 = \(mathOp(5, num2: 0, op: add))")
print("1 + 8 = \(mathOp(1, num2: 8, op: add))")
print("2 + 6 = \(mathOp(2, num2: 6, op: add))")

// examples - substract
print("\nexamples: substract")
print("3 - 4 = \(mathOp(3, num2: 4, op: subtract))")
print("5 - 0 = \(mathOp(5, num2: 0, op: subtract))")
print("1 - 8 = \(mathOp(1, num2: 8, op: subtract))")
print("2 - 6 = \(mathOp(2, num2: 6, op: subtract))")

// examples - multiply
print("\nexamples: multiply")
print("3 * 4 = \(mathOp(3, num2: 4, op: multiply))")
print("5 * 0 = \(mathOp(5, num2: 0, op: multiply))")
print("1 * 8 = \(mathOp(1, num2: 8, op: multiply))")
print("2 * 6 = \(mathOp(2, num2: 6, op: multiply))")

// examples - divide
print("\nexamples: divide")
print("3 / 4 = \(mathOp(3, num2: 4, op: divide))")
print("5 / 1 = \(mathOp(5, num2: 1, op: divide))")
print("1 / 8 = \(mathOp(1, num2: 8, op: divide))")
print("2 / 6 = \(mathOp(2, num2: 6, op: divide))")

/* Array Fun */
func addArray (nums: [Int]) -> Int {
    var sum : Int = 0
    for num : Int in nums {
        sum += num
    }
    return sum
}

func mulArray (nums: [Int]) -> Int {
    if (nums.count == 0) {
        return 0;
    } else {
        var sum : Int = 1
        for num : Int in nums {
            sum *= num
        }
        return sum
    }
}

func count (nums: [Int]) -> Int {
    return nums.count
}

func avg (nums: [Int]) -> Int {
    if (nums.count == 0) {
        return 0;
    } else {
       return addArray(nums) / count(nums)
    }
    
}

func mathArrayOp (nums: [Int], op: ([Int] -> Int)) -> Int {
    return op(nums);
}

// examples - array add
print("\nexamples: array add")
print("[3, 4, 5, 6] = \(mathArrayOp([3, 4, 5, 6], op: addArray))")
print("[] = \(mathArrayOp([], op: addArray))")
print("[1] = \(mathArrayOp([1], op: addArray))")
print("[2, 2, 2] = \(mathArrayOp([2, 2, 2], op: addArray))")

// examples - array multiply
print("\nexamples: array multiply")
print("[3, 4, 5, 6] = \(mathArrayOp([3, 4, 5, 6], op: mulArray))")
print("[] = \(mathArrayOp([], op: mulArray))")
print("[1] = \(mathArrayOp([1], op: mulArray))")
print("[2, 2, 2] = \(mathArrayOp([2, 2, 2], op: mulArray))")

// examples - array count
print("\nexamples: array count")
print("[3, 4, 5, 6] = \(mathArrayOp([3, 4, 5, 6], op: count))")
print("[] = \(mathArrayOp([], op: count))")
print("[1] = \(mathArrayOp([1], op: count))")
print("[2, 2, 2] = \(mathArrayOp([2, 2, 2], op: count))")

// examples - array avg
print("\nexamples: array avg")
print("[3, 4, 5, 6] = \(mathArrayOp([3, 4, 5, 6], op: avg))")
print("[] = \(mathArrayOp([], op: avg))")
print("[1] = \(mathArrayOp([1], op: avg))")
print("[2, 2, 2] = \(mathArrayOp([2, 2, 2], op: avg))")

/* Points */
func addTuplePoints (p1: (x: Int, y: Int), p2: (x: Int, y: Int)) -> (Int, Int) {
    return (p1.x + p2.x, p1.y + p2.y)
}

func subtractTuplePoints (p1: (x: Int, y: Int), p2: (x: Int, y: Int)) -> (Int, Int) {
    return (p1.x - p2.x, p1.y - p2.y)
}

func addDictPoints(p1 : [Int: Int]?, p2 : [Int: Int]?) -> [Int: Int] {
    var result: [Int: Int]? = [:]
    var newX = 0
    var newY = 0
    for (x, y) in p1!{
        newX = x
        newY = y
    }
    for (x, y) in p2! {
        newX += x
        newY += y
    }
    result![newX] = newY
    return result!
}

func subtractDictPoints (p1 : [Int: Int]?, p2 : [Int: Int]?) -> [Int: Int] {
    var result: [Int: Int]? = [:]
    var newX = 0
    var newY = 0
    for (x, y) in (p1)! {
        newX = x
        newY = y
    }
    for (x, y) in (p2)! {
        newX -= x
        newY -= y
    }
    result![newX] = newY
    return result!
}


// examples - point tuple addition
print("\nexamples: point addition")
print("(0,0) + (3,3) = \(addTuplePoints((0,0), p2: (3,3)))")
print("(2,4) + (3,3) = \(addTuplePoints((2,4), p2: (3,3)))")
print("(1,5) + (2,3) = \(addTuplePoints((1,5), p2: (2,3)))")
print("(1,1) + (4,1) = \(addTuplePoints((1,1), p2: (4,1)))")

// examples - point tuple substraction
print("\nexamples: point substraction")
print("(0,0) - (3,3) = \(subtractTuplePoints((0,0), p2: (3,3)))")
print("(2,4) - (3,3) = \(subtractTuplePoints((2,4), p2: (3,3)))")
print("(1,5) - (2,3) = \(subtractTuplePoints((1,5), p2: (2,3)))")
print("(1,1) - (4,1) = \(subtractTuplePoints((1,1), p2: (4,1)))")

// examples - point dictionary addition
print("\nexamples: point dictionary addition")
print("(0,0) + (3,3) = \(addDictPoints([0: 0], p2: [3: 3]))")
print("(2,4) + (3,3) = \(addDictPoints([2: 4], p2: [3: 3]))")
print("(1,5) + (2,3) = \(addDictPoints([1: 5], p2: [2: 3]))")
print("(1,1) + (4,1) = \(addDictPoints([1: 1], p2: [4: 1]))")

// examples - point dictionary substraction
print("\nexamples: point dictionary substraction")
print("(0,0) - (3,3) = \(subtractDictPoints([0: 0], p2: [3: 3]))")
print("(2,4) - (3,3) = \(subtractDictPoints([2: 4], p2: [3: 3]))")
print("(1,5) - (2,3) = \(subtractDictPoints([1: 5], p2: [2: 3]))")
print("(1,1) - (4,1) = \(subtractDictPoints([1: 1], p2: [4: 1]))")

