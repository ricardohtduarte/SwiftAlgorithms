import UIKit

// Return TRUE if there two numbers whose the sum is equal to sum variable

let array:[Int] = [1, 3, 6, 7, 7, 12, 14]
let sum:Int = 20

// Brute force: not great, has O(n^2) complexity

func checkSum(array: [Int], sum: Int) -> Bool {
    for (i, _) in array.enumerated() {
        for (j, _) in array.enumerated() where j != i {
            if array[i] + array[j] == sum {
                return true
            }
        }
    }
    return false
}

print("Brute Force: \(checkSum(array: array, sum: sum))")


// Pointers: start with two pointers, one at the begin and the other at the end.
// Sum the two values. If the sum is bigger than the sum variable value descend the
// second pointer until we get the correct value of the sum, or if the sum
// is lower than correct value of the sum, if it's lower, raise the first pointer.
// If the pointers cross, the sum doesn't exist in the array. THE ARRAY MUST BE SORTED.
// The complexity for this algorithm is O(n)
// which is a big improvement over the brute force approach

func checkSumWithPointers(array: [Int], sum: Int) -> Bool {
    var firstValue: Int = 0
    var lastValue: Int = array.count - 1

    while(firstValue < lastValue) {

        let arraySum = array[firstValue] + array[lastValue]

        if arraySum == sum { return true }

        else if arraySum > sum { lastValue -= 1 }

        else if arraySum < sum { firstValue += 1 }
    }
    return false
}

print("Pointers: \(checkSumWithPointers(array: array, sum: sum))")

// Pointers but recursively, because reasons

func checkSumWithPointersRecursively(array: [Int], sum: Int) -> Bool {
    var firstIndex = 0
    var lastIndex = array.count-1
    return checkSumWithPointersRecursivelyAux(array: array, sum: sum, firstIndex: &firstIndex, lastIndex: &lastIndex)
}

func checkSumWithPointersRecursivelyAux(array: [Int], sum: Int, firstIndex: inout Int, lastIndex: inout Int) -> Bool {

    guard firstIndex < lastIndex else {
        return false
    }

    let arraySum = array[firstIndex] + array[lastIndex]

    if arraySum == sum {
        return true
    }

    if arraySum > sum {
        lastIndex -= 1
    } else if arraySum < sum {
        firstIndex += 1
    }

    return checkSumWithPointersRecursivelyAux(array: array, sum: sum, firstIndex: &firstIndex, lastIndex: &lastIndex)
}

print("Pointers Recursively: \(checkSumWithPointersRecursively(array: array, sum: sum))")
