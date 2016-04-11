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

enum ParamError: ErrorType {
    case TwoDimensionalPointsOnly
    case PointsAreDouble

}

func addTuplePoints (p1: (x: Int, y: Int), p2: (x: Int, y: Int)) -> (Int, Int) {
    return (p1.x + p2.x, p1.y + p2.y)
}

func subtractTuplePoints (p1: (x: Int, y: Int), p2: (x: Int, y: Int)) -> (Int, Int) {
    return (p1.x - p2.x, p1.y - p2.y)
}

func addDictPoints(p1: [String: Int]?, p2: [String: Int]?) throws -> [String: Int]? {
    // Sending in Doubles instead of Ints
    if (p1 == nil && p2 == nil) {
        throw ParamError.PointsAreDouble
    // Sending in no points
    } else if (p1!.count == 0 && p2!.count == 0){
        return ["x": 0, "y": 0]
    // Sent in more than 2D points
    } else if (p1!.count > 2 || p2!.count > 2) {
        throw ParamError.TwoDimensionalPointsOnly
    // Only send in first point
    } else if (p1!.count == 2 && p2!.count == 0) {
        return p1!
    // Only send in second point
    } else if (p1!.count == 0 && p2!.count == 2) {
        return p2!
    // Sending in one coordinate of first point and no second point
    } else if (p1!.count == 1 && p2!.count == 0) {
        if (p1!["x"] == nil) {
            return ["x": 0, "y": p1!["y"]!]
        } else {
            return ["x": p1!["x"]!, "y": 0]
        }
    // Sending in no first point and one coordinate of second point
    } else if (p1!.count == 0 && p2!.count == 1) {
        if (p2!["x"] == nil) {
            return ["x": 0, "y": p2!["y"]!]
        } else {
            return ["x": p2!["x"]!, "y": 0]
        }
    // Sending in one coordinate of first point and normal second point
    } else if (p1!.count == 1 && p2!.count == 2) {
        if (p1!["x"] == nil) {
            return ["x": p2!["x"]!, "y": p1!["y"]! + p2!["y"]!]
        } else {
            return ["x": p1!["x"]! + p2!["x"]!, "y": p2!["y"]!]
        }
    // Sending in normal first point and no coordinate of second point
    } else if (p1!.count == 2 && p2!.count == 1) {
        if (p2!["x"] == nil) {
            return ["x": p1!["x"]!, "y": p1!["y"]! + p2!["y"]!]
        } else {
            return ["x": p1!["x"]! + p2!["x"]!, "y": p1!["y"]!]
        }
    // Normal case. Both coordinates of both points
    } else {
        var result : [String: Int] = [:]
        result["x"] = p1!["x"]! + p2!["x"]!
        result["y"] = p1!["y"]! + p2!["y"]!
        return result
    }
}

func subtractDictPoints(p1: [String: Int]?, p2: [String: Int]?) throws -> [String: Int]? {
    // Sending in Doubles instead of Ints
    if (p1 == nil && p2 == nil) {
        throw ParamError.PointsAreDouble
        // Sending in no points
    } else if (p1!.count == 0 && p2!.count == 0){
        return ["x": 0, "y": 0]
        // Sent in more than 2D points
    } else if (p1!.count > 2 || p2!.count > 2) {
        throw ParamError.TwoDimensionalPointsOnly
        // Only send in first point
    } else if (p1!.count == 2 && p2!.count == 0) {
        return p1!
        // Only send in second point
    } else if (p1!.count == 0 && p2!.count == 2) {
        return p2!
        // Sending in one coordinate of first point and no second point
    } else if (p1!.count == 1 && p2!.count == 0) {
        if (p1!["x"] == nil) {
            return ["x": 0, "y": p1!["y"]!]
        } else {
            return ["x": p1!["x"]!, "y": 0]
        }
        // Sending in no first point and one coordinate of second point
    } else if (p1!.count == 0 && p2!.count == 1) {
        if (p2!["x"] == nil) {
            return ["x": 0, "y": -p2!["y"]!]
        } else {
            return ["x": -p2!["x"]!, "y": 0]
        }
        // Sending in one coordinate of first point and normal second point
    } else if (p1!.count == 1 && p2!.count == 2) {
        if (p1!["x"] == nil) {
            return ["x": -p2!["x"]!, "y": p1!["y"]! - p2!["y"]!]
        } else {
            return ["x": p1!["x"]! - p2!["x"]!, "y": -p2!["y"]!]
        }
        // Sending in normal first point and no coordinate of second point
    } else if (p1!.count == 2 && p2!.count == 1) {
        if (p2!["x"] == nil) {
            return ["x": p1!["x"]!, "y": p1!["y"]! - p2!["y"]!]
        } else {
            return ["x": p1!["x"]! - p2!["x"]!, "y": p1!["y"]!]
        }
        // Normal case. Both coordinates of both points
    } else {
        var result : [String: Int] = [:]
        result["x"] = p1!["x"]! - p2!["x"]!
        result["y"] = p1!["y"]! - p2!["y"]!
        return result
    }
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
print("(1,1) + (3,3) = \(try addDictPoints(["x": 1, "y": 1], p2: ["x": 3, "y": 3])!)")
print("(2,4) + (3,3) = \(try addDictPoints(["x": 2, "y": 4], p2: ["x": 3, "y": 3])!)")
print("(0,0) + (0,0) = \(try addDictPoints([:], p2: [:])!)")
print("(0,0) + (7,0) = \(try addDictPoints([:], p2: ["x": 7])!)")
print("(0,0) + (0,7) = \(try addDictPoints([:], p2: ["y": 7])!)")
print("(7,0) + (0,0) = \(try addDictPoints(["x": 7], p2: [:])!)")
print("(0,7) + (0,0) = \(try addDictPoints(["y": 7], p2: [:])!)")
print("(1,0) + (4,1) = \(try addDictPoints(["x": 1], p2: ["x": 4, "y": 1])!)")
print("(0,1) + (4,1) = \(try addDictPoints(["y": 1], p2: ["x": 4, "y": 1])!)")
print("(4,1) + (1,0) = \(try addDictPoints(["x": 4, "y": 1], p2: ["x": 1])!)")
print("(4,1) + (0,1) = \(try addDictPoints(["x": 4, "y": 1], p2: ["y": 1] )!)")

// examples - point dictionary substraction
 print("\nexamples: point dictionary subtraction")
 print("(1,1) - (3,3) = \(try subtractDictPoints(["x": 1, "y": 1], p2: ["x": 3, "y": 3])!)")
 print("(2,4) - (3,3) = \(try subtractDictPoints(["x": 2, "y": 4], p2: ["x": 3, "y": 3])!)")
 print("(0,0) - (0,0) = \(try subtractDictPoints([:], p2: [:])!)")
 print("(0,0) - (7,0) = \(try subtractDictPoints([:], p2: ["x": 7])!)")
 print("(0,0) - (0,7) = \(try subtractDictPoints([:], p2: ["y": 7])!)")
 print("(7,0) - (0,0) = \(try subtractDictPoints(["x": 7], p2: [:])!)")
 print("(0,7) - (0,0) = \(try subtractDictPoints(["y": 7], p2: [:])!)")
 print("(1,0) - (4,1) = \(try subtractDictPoints(["x": 1], p2: ["x": 4, "y": 1])!)")
 print("(0,1) - (4,1) = \(try subtractDictPoints(["y": 1], p2: ["x": 4, "y": 1])!)")
 print("(4,1) - (1,0) = \(try subtractDictPoints(["x": 4, "y": 1], p2: ["x": 1])!)")
 print("(4,1) - (0,1) = \(try subtractDictPoints(["x": 4, "y": 1], p2: ["y": 1] )!)")

