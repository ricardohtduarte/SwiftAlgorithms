//: Playground - noun: a place where people can play

import UIKit

//return true if there two numbers that the sum is equal to sum

let array:[Int] = [1, 3, 6, 7, 7, 12, 14]
let sum:Int = 9

//brute force

func checks_sum (array: [Int], sum: Int) -> Bool{
    for i in 0..<array.count{
        for j in 0..<array.count where j != i{
            if array[i] + array[j] == sum{
                return true
            }
        }
    }
    return false
}


checks_sum(array: array, sum: sum)
